# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  transaction_id :integer
#  quantity       :integer
#  type           :string
#  address        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name           :string
#  email          :string
#

class Order < ActiveRecord::Base
  def transaction
    Transaction.find(transaction_id)
  end

  def as_json(options = {})
    super(options).merge(
      quantity: self.quantity,
      type: self.type,
      address: self.address,
      name: self.name,
      email: self.email
    )
  end

end
