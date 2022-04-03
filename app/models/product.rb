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
<<<<<<< Updated upstream
    has_many(
        :line_items,
        class_name: 'LineItem',
        foreign_key: 'lineitem_id',
        inverse_of: :line_item,
        dependent: :destroy
    )
=======
    validates :name, :description, presence: true

    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
    has_many :line_items
      
    private
      
    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, 'Line items present')
            throw :abort
        end
    end
>>>>>>> Stashed changes
end
