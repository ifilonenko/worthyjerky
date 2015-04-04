class StripeProcessor
  attr_reader :token
  attr_reader :amount
  def initialize(token, amount)
    @token = token
    @amount = amount
  end

  def charge(description='')
    Stripe.api_key = 'PUT KEY HERE'
    Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      card: token,
      description: description
    )
  end
end
