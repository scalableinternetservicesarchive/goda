class HitcherLike < ActiveRecord::Base
	belongs_to :user
	belongs_to :hitcher
end
