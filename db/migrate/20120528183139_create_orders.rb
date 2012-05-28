class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :end_date

      t.timestamps
    end
  end
end
