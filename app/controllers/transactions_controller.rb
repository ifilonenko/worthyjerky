require Rails.root.join('servos/stripe_processor').to_path
require Rails.root.join('servos/transactor').to_path
require Rails.root.join('app/mailers/order_mailer').to_path
class TransactionsController < ApplicationController
  def create
    preferred_email = params[:email]
    count = params[:quantity].to_i
    transaction_params = {
      email: preferred_email,
      address: params[:address],
      selection: params[:selection],
      name: params[:name],
      quantity: count,
      token: params[:token]
    }
    processor = (Rails.env.test? && params[:processor]) ? params[:processor] : StripeProcessor
    @order = Transactor.new(processor).process(transaction_params)
    OrderMailer.send_orders(@order, preferred_email).deliver_now if @order
    # else
    #   Thread.new(@order, preferred_email) { |tix, email| TicketMailer.send_order(tix, email).deliver_now } if @order

    respond_to do |format|
      format.json { render json: { success: !@order.blank? } }
    end
  end
end
