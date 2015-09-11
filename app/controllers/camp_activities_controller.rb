class CampActivitiesController < ApplicationController
before_action :set_camp_activity , :only => [:show, :edit , :update , :destroy]


	def index
		@camp_activities = CampActivity.all
	end
	def new
		@camp_activity = CampActivity.new
	end 
	def create
		@camp_activity = CampActivity.new(camp_activity_params)		
		@camp_activity.save 
		redirect_to camp_activities_path 
		
	end
	def edit
	end
	def update
		@camp_activity.update(camp_activity_params)

		redirect_to camp_activities_path 
	end
	def destroy 
		@camp_activity.destroy 
		redirect_to camp_activities_path 
		
	end 
private 
	
	def camp_activity_params
		params.require(:camp_activity).permit(:name ,
		:camp_worker_ids => [] )
	end
	def set_camp_activity
		@camp_activity = CampActivity.find(params[:id]);
	end
end
