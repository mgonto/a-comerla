class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :end_date
      t.references :restaurant

      t.timestamps
    end
    add_index :orders, :restaurant_id
  end
end
