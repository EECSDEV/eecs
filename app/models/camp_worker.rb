class CampWorker < ActiveRecord::Base
	has_many :camp_activity_workerships 
	has_many :camp_activities , :through => :camp_activity_workerships

end
