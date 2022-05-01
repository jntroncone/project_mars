# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  status     :string           default("Pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
