class Order < ActiveRecord::Base
  has_many :dish_orders

  validates :end_date,
          :date => {:after => Proc.new { Time.now },
                    :before => Proc.new { Time.now + 1.day } }

  validates :dish_orders, :presence => true

  validates_associated :dish_orders
  attr_accessible :dish_orders, :end_date
  accepts_nested_attributes_for :dish_orders
end
