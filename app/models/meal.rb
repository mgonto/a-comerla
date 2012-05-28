class Meal < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :description, :name, :price, :restaurant_id
  validates :description, :name, :price, :restaurant_id, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
end
