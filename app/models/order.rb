# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :products, through: :line_item
end
