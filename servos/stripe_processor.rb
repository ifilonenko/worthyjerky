class StripeProcessor
  attr_reader :token
  attr_reader :amount
  def initialize(token, amount)
    @token = token
    @amount = amount
  end

  def charge(description='')
    p 'Now chargin'
    Stripe.api_key = ENV['STRIPE_LIVE_SECRET_KEY']
    Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      card: token,
      description: description
    )
  end
end
