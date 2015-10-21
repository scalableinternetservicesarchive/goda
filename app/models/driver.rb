class Driver < ActiveRecord::Base
   validates :depart_time, :destination, :departure,:price, presence:true
   belongs_to :user
end
