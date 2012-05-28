class Order < ActiveRecord::Base
  attr_accessible :end_date
  has_many :dishorders
end
