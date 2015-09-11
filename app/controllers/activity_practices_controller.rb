class ActivityPracticesController < ApplicationController
	before_action :find_activity 

	def index
		@camp_practices = @camp_activity.camp_practices 
	end 
	def show 
		@camp_practice = @camp_activity.camp_practices.find(params[:id])
	end
	def new 
		@camp_practice = @camp_activity.camp_practices.build 
	end
	def create
		@camp_practice = @camp_activity.camp_practices.build(practice_params)
		if @camp_practice.save
			redirect_to camp_activity_camp_practices_url (@camp_activity)
		else
			render :action => :new 
		end
	end
	def edit 
		@camp_practice = @camp_activity.camp_practices.find(params[:id])
	end
	def update
		@camp_practice = @camp_activity.camp_practices.find(params[:id])
		if @camp_practice.update(practice_params)
			redirect_to camp_activity_camp_practices_url (@camp_activity)
		else
			render :action => :edit
		end
	end
	def destroy 
		@camp_practice = @camp_activity.camp_practices.find(params[:id])
		@camp_practice.destroy 
		redirect_to camp_activity_camp_practices_url(@camp_activity)
	end
protected 
	def find_activity
		@camp_activity = CampActivity.find( params[:camp_activity_id])
	end
	def practice_params
		params.require(:camp_practice).permit(:name , :starts_at)
	end
end
