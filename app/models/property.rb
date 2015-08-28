class Property < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :propertytags
  has_many :tags, through: :propertytags
  has_many :bookings
  before_save :title_capitalize

  private
    def title_capitalize
        self.title = self.title.capitalize 
    end
end
