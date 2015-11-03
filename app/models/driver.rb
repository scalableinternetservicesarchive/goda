class Driver < ActiveRecord::Base
   validates :depart_time, :destination, :departure,:estimated_arrival_time, :contact_info, presence:true
   belongs_to :user
   has_many :rides
   has_many :drivercomments
end
