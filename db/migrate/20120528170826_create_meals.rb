class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :restaurant

      t.timestamps
    end
    add_index :meals, :restaurant_id
  end
end
