class User < ActiveRecord::Base
    validates :name,presence:true, uniqueness:true
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence:true, length: {minimum: 6}
    has_many :drivers
    has_many :hitchers
    has_many :rides
    
    def book(driver_id)
	current_ride = rides.find_by_driver_id(driver_id)
	if current_ride
		current_ride.quantity +=1
	else
		current_ride = rides.build(driver_id: driver_id)
	end
        current_ride
     end
end
