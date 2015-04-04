# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  transaction_id :integer
#  quantity       :integer
#  selection      :string
#  address        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name           :string
#  email          :string
#

require 'test_helper'
require 'stripe'
require Rails.root.join('servos/transactor').to_path
require Rails.root.join('servos/stripe_processor').to_path
class OrderTest < ActiveSupport::TestCase
    token = {
      id: "tok_1044TY4GgNdNSosPXdAmIZdt", 
      card: {
        name: 'Ilan Filonenko',
        address_line1: "12 Main Street",
        address_line2: "Apt 42",
        address_city: "Palo Alto",
        address_state: "CA",
        address_zip: "94301",
        address_country: "US",
        country: "US",
        exp_month: 2,
        exp_year: 2016,
        last4: "4242",
        object: "card",
        brand: "Visa",
        funding: "credit"
      },
      created: 1428145937, 
      livemode: false, 
      type: "card",
      object: "token", 
      used: false 
    }
    # Create the charge on Stripe's servers - this will charge the user's card
    # begin
    #   charge = Stripe::Charge.create(
    #     :amount => 1000, # amount in cents, again
    #     :currency => "usd",
    #     :source => token[:id],
    #     :description => "Some stuff"
    #    )
    # rescue Stripe::CardError => e
    #   p 'for the love of god'
    # end
    test "if Order works" do
      transaction_params = {
        email: 'ilan.fil@gmail.com',
        address: '57 Walbrooke Rd, Scarsdale, NY, 10583, United States',
        selection: 'Citrus BBQ',
        name: 'Ilan Filonenko',
        quantity: 3,
        token: token
      }
      processor = StripeProcessor
      @order = Transactor.new(processor).process(transaction_params)
      # transaction = Transaction.create(is_paid: true, description: 'something',  value: 20.00)
      # @order = Order.create(transaction_id: transaction.id, quantity: transaction_params[:quantity], address: transaction_params[:address], email: transaction_params[:email], selection: transaction_params[:selection], name: transaction_params[:name])
      p @order
      assert @order.quantity
      assert @order.selection == 'Citrus BBQ'
      assert @order.address == '57 Walbrooke Rd, Scarsdale, NY, 10583, United States'
      assert @order.name == 'Ilan Filonenko'
      assert @order.transaction.value == 20
      assert @order.transaction.is_paid == true
    end
end
