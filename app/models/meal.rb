class Meal < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :description, :name, :price, :restaurant_id
end
