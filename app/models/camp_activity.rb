class CampActivity < ActiveRecord::Base
	has_many :camp_activity_workerships 
	has_many :camp_workers , :through => :camp_activity_workerships


	has_many :camp_practices 
end
