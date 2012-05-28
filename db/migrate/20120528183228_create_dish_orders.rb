class CreateDishOrders < ActiveRecord::Migration
  def change
    create_table :dish_orders do |t|
      t.references :order
      t.references :user
      t.references :meal

      t.timestamps
    end
    add_index :dish_orders, :order_id
    add_index :dish_orders, :user_id
    add_index :dish_orders, :meal_id
  end
end
