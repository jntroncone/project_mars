# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
    has_many(
        :line_items,
        class_name: 'LineItem',
        foreign_key: 'lineitem_id',
        inverse_of: :line_item,
        dependent: :destroy
    )
end
