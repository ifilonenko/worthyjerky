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
  # test "the truth" do
  #   assert true
  # end
end
