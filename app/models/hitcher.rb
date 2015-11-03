class Hitcher < ActiveRecord::Base
    validates :departure, :destination, :depart_time, :arrival_time, :contact_info, presence: true
    belongs_to :user
    has_many :takes
    has_many :hitchercomments
end
