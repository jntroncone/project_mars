# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
    has_many(
        :products,
        class_name: 'Product',
        foreign_key: 'catergory_id',
        inverse_of: :category,
        dependent: :destroy
    )
end
