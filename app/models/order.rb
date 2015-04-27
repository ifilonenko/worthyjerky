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
#  completed      :boolean
#

class Order < ActiveRecord::Base
  def transaction
    Transaction.find(transaction_id)
  end

  def as_json(options = {})
    super(options).merge(
      quantity: self.quantity,
      selection: self.selection,
      address: self.address,
      name: self.name,
      email: self.email,
      completed: self.completed
    )
  end

end
