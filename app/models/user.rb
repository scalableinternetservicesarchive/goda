class User < ActiveRecord::Base
    validates :name,presence:true, uniqueness:true
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence:true, length: {minimum: 6}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    has_many :drivers
    has_many :hitchers
    has_many :rides
    has_many :takes
    
    def book(driver_id, quantity)
	current_ride = rides.find_by_driver_id(driver_id)
	if current_ride
		current_ride.quantity += quantity
	else
		current_ride = rides.build(driver_id: driver_id)
        current_ride.quantity += quantity
	end
        current_ride
     end

     def book_hitcher(hitcher_id)
	current_take = takes.find_by_hitcher_id(hitcher_id)
	if current_take
	
        else
		current_take = takes.build(hitcher_id: hitcher_id)
        end
	current_take
     end

end
