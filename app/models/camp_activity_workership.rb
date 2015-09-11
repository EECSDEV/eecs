class CampActivityWorkership < ActiveRecord::Base
	belongs_to :camp_worker
	belongs_to :camp_activity

end
