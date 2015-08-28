class Property < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :propertytags
  has_many :tags, through: :propertytags
  has_many :bookings

end
