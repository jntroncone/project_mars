# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
<<<<<<< Updated upstream
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  order_id   :bigint           not null
=======
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
>>>>>>> Stashed changes
#  product_id :bigint           not null
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
<<<<<<< Updated upstream
#  index_line_items_on_order_id    (order_id)
=======
>>>>>>> Stashed changes
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
<<<<<<< Updated upstream
#  fk_rails_...  (order_id => orders.id)
=======
>>>>>>> Stashed changes
#  fk_rails_...  (product_id => products.id)
#
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
<<<<<<< Updated upstream
  belongs_to :order
=======
>>>>>>> Stashed changes
end
