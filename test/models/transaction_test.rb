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

require 'test_helper'
class TransactionTest < ActiveSupport::TestCase
    test "if Transactor worked" do
      transaction = Transaction.new(is_paid: true, description: 'something',  value: 20)
      assert transaction.is_paid == true
      assert transaction.description?
      assert transaction.value?
    end
end
