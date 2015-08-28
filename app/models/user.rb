class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :properties
  has_many :bookings

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  def self.authenticate(email,password)
  	@user = User.find_by_email(email)

    if @user
  		if @user.password == password
       
  			return @user
  		else
  			return false
  		end
  	else
      return false
    end
  end
  
end
