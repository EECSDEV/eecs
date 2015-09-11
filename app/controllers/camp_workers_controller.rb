class CampWorkersController < ApplicationController
before_action :set_camp_worker , :only => [:show , :edit , :update , :destroy]


  def index
    @camp_workers= CampWorker.all
  end
	def show
	end 
  def new
    @camp_worker = CampWorker.new
  end
  def create
    @camp_worker = CampWorker.new(camp_worker_params)
    @camp_worker.save
    redirect_to camp_workers_path

  end
  def edit
  end
  def update
    @camp_worker.update(camp_worker_params)

    redirect_to camp_worker_path(@camp_worker)
  end
  def destroy
    @camp_worker.destroy
    redirect_to camp_workers_path

  end
private

  def camp_worker_params
    params.require(:camp_worker).permit(:name , :gender , :grade , :email , :cellphone , :level , :department , :team,
		:camp_activity_ids =>[])
  end
  def set_camp_worker
    @camp_worker = CampWorker.find(params[:id]);
  end




end 


