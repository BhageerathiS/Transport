class Vehicle < ActiveRecord::Base
  has_many :drivers
  validates :make, :model, :variant, :year, :veh_class, :capacity, :vahicle_number,presence: true
end
