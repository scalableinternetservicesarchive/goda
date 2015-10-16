class Driver < ActiveRecord::Base
   validates :depart_time, :destination, :departure,:price, presence:true
end
