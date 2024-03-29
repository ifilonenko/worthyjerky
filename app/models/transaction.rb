# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  is_paid     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  value       :float
#

class Transaction < ActiveRecord::Base
  has_one :order
end
