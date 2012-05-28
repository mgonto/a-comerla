class DishOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  belongs_to :meal

  attr_accessible :meal

  validates :user, :presence => true
  validates :meal, :presence => true
  attr_accessible :user, :meal
end
