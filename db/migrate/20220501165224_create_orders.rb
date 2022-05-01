class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :status, :default => "Pending"

      t.timestamps
    end
  end
end
