class DishOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  belongs_to :meal
  # attr_accessible :title, :body
end
