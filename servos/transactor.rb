class Transactor
  attr_reader :payment_processor
  def initialize(payment_processor)
    raise RuntimeError, 'Payment processor cannot be blank' if payment_processor.blank?
    @payment_processor = payment_processor
  end

  def process(params)
    transaction = create_transaction(params)
    begin
      make_charge(params)
    rescue => e
      # FIXME: Be more specific about type of error rescued... opps
      p 'Error making charge'
      p e
      transaction.is_paid = false
      transaction.save      
      return false
    end
    # Transaction was successful
    transaction.is_paid = true
    transaction.save
    # Create an order
    create_order(params, transaction)
  end

  private
  def charge_amount(quantity)
    if quantity == 1
      return 8
    elsif quantity == 3
      return 20
    elsif quantity == 6
      return 28
  end
  
  def make_charge(params)
    # Exceptions thrown by payment processor will pass through
    token = params[:token]
    email = params[:email]
    address = params[:address]
    type = params[:type]
    name = params[:name]
    quantity = params[:quantity]
    amount = charge_amount(quantity)
    description = charge_description(quantity,type,name,address,email)
    payment_processor.new(token, amount).charge(description)
  end

  def create_order(params, transaction)
    Order.new(transaction_id: transaction.id, quantity: params[:quantity], address: params[:address], email: params[:email], type: params[:type], name: params[:name])
  end

  def charge_description(name,address,email)
    "Order for #{ quantity } #{ type } for #{ name } to #{ address } and you can email him at #{ email }"
  end

  def create_transaction(params)
    email = params[:email]
    address = params[:address]
    type = params[:type]
    name = params[:name]
    quantity = params[:quantity]
    value = charge_amount(quantity)
    Transaction.new(is_paid: false, description: charge_description(quantity,type,name,address,email),  value: value)
  end
end
