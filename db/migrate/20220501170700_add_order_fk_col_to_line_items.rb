class AddOrderFkColToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :line_items, :order, foreign_key: true, null: false
  end
end
