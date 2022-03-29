# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
    has_many( 
        :line_items,
        class_name: 'LineItem',
        foreign_key: 'line_item_id',
        inverse_of: :cart,
        dependent: :destroy)
    has_many :products, through: :line_items
end
