class AdminparamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_param, :only => [ :show, :edit, :update, :destroy] 
	
  def index
    @adminparams = Apminparam.all
  end

  def new
    @adminparam = Adminparam.new
  end

  def create
    @adminparam=Adminparam.new(admin_params)
    
    if @adminparam.save
      redirect_to adminparams_url
    else
      render :action => :new
    end
  end
  
  def show
      #if current_user.is_admin!=1
      #  redirect_to root_url
      #end
  end
  
  def destroy
    @admin.destroy

    redirect_to courses_url
  end

  def edit
     if current_user.is_admin ==  0
        redirect_to root_url
      end
  end
  
  def update
    
    if @adminparam.update(admin_params)
      redirect_to adminparams_url(@adminparam)
    else
      render :action => :edit
    end

  end
  
  private

  def admin_params
    params.require(:adminparam).permit(:point_get_feedback, :point_get_pastexam, :point_need_feedback, :point_need_pastexam)
  end

  def set_param
    @adminparam = Adminparam.first
    @user=current_user
  end

end
