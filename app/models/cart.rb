# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :cart

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

end
