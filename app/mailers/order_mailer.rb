require 'mailgun'
class OrderMailer < ActionMailer::Base
  default from: "\"Worthy Jerky \" <sales@worthyjerky.com>"
  def send_orders(order, email)
    name = order.name
    address = order.address
    selection = order.selection
    quantity = order.quantity
    mail(to: email, subject: "Your receipt: #{ quantity } order(s) of #{ selection }", body: "Dear #{ name }, this is your email confirmation for ordering #{ quantity } order(s) of #{ selection }. It will be delivered to #{ address } in a span of 2-6 buisness days.")
    # mail(to: "ank43@cornell.edu", subject: " #{ quantity } order(s) of #{ selection }", body: "#{ name } wants #{ quantity } order(s) of #{ selection }. Deliver to #{ address }.")
  end
end
