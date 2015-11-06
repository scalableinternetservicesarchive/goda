class Driver < ActiveRecord::Base
   validates :depart_time, :destination, :departure,:estimated_arrival_time, :contact_info, presence:true
   belongs_to :user
   has_many :rides, dependent: :destroy
   has_many :drivercomments, dependent: :destroy
   has_many :driver_likes, dependent: :destroy
   
end
