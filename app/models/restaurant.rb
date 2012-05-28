class Restaurant < ActiveRecord::Base
  validates :address, :phone, :name, :presence => true
  validates :phone, :numericality => { :only_integer => true }
  attr_accessible :address, :name, :phone

  has_many :meals
end
