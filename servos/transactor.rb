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
      # HAVE TO MAKE THIS WORK  
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
      return 8.00
    elsif quantity == 3
      return 20.00
    elsif quantity == 6
      return 28.50
    end
  end
  
  def make_charge(params)
    # Exceptions thrown by payment processor will pass through
    token = params[:token]
    p token
    email = params[:email]
    p email
    address = params[:address]
    p address
    selection = params[:selection]
    p type
    name = params[:name]
    p name
    quantity = params[:quantity]
    p quantity
    amount = charge_amount(quantity)
    p amount
    description = charge_description(quantity,type,name,address,email)
    p description
    payment_processor.new(token, amount).charge(description)
  end

  def create_order(params, transaction)
    p params
    p '---------'
    p transaction
    Order.new(transaction_id: transaction.id, quantity: params[:quantity], address: params[:address], email: params[:email], selection: params[:selection], name: params[:name])
  end

  def charge_description(quantity,type,name,address,email)
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
