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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end