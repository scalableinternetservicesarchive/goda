class Hitcher < ActiveRecord::Base
    validates :departure, :destination, :depart_time, presence: true
    belongs_to :user
end
