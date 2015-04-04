class OrderMailer < ActionMailer::Base
  default from: "\"Worthy Jerky \" <admin@worthyjerky.com>"
  def send_tickets(order, email)
    name = order.name
    address = order.address
    type = order.type
    quantity = order.quantity
    value = order.value
    mail(to: email, subject: "Your receipt: #{ quantity } order(s) of #{ type }", body: 'Dear #{ name }, this is your email confirmation for ordering #{ quantity } order(s) of #{ type } at a price of #{ value }. It will be delivered to #{ address } in a span of 2-6 buisness days.')
  end
end
