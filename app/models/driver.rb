class Driver < ActiveRecord::Base
  has_many :vehicles
  validates :name, :dob, :licence_class, :issue_date, :licence_number ,presence: true
end
