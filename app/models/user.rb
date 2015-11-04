class User < ActiveRecord::Base
    validates :name,presence:true, uniqueness:true
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence:true, length: {minimum: 6}
    has_many :drivers
    has_many :hitchers
    has_many :rides
    has_many :takes
    has_many :driver_likes
    has_many :hitcher_likes
    
    def total
	sum1 = 0
        sum2 = 0
        sum = 0
	drivers.each {|d| sum1 += d.like_num}
        hitchers.each {|h| sum2 += h.like_num}
	sum = sum1 + sum2
    end

    def add_hitcher_like(hitcher_id)
	current_hitcher_like = hitcher_likes.find_by_hitcher_id(hitcher_id)
        if current_hitcher_like
		current_hitcher_like.quantity += 1
	else
		current_hitcher_like = hitcher_likes.build(hitcher_id: hitcher_id)
	end
	current_hitcher_like
    end

 
    def add_driver_like(driver_id)
	current_driver_like = driver_likes.find_by_driver_id(driver_id)
	if current_driver_like
		current_driver_like.quantity += 1
	else
		current_driver_like = driver_likes.build(driver_id: driver_id)
	end
	current_driver_like
    end
 
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
