# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
<<<<<<< Updated upstream
    has_many( 
        :line_items,
        class_name: 'LineItems',
        foreign_key: 'line_item_id',
        inverse_of: :cart,
        dependent: :destroy)
    has_many :products, through: :line_items
=======
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

>>>>>>> Stashed changes
end
