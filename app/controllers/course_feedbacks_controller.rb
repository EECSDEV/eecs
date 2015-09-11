class CourseFeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course
  before_action :find_user
  before_action :find_adminparam
  before_action :user_confirm

  def index 
    @feedbacks= @course.feedbacks.order("year").page(params[:page]).per(10)
  end

  def show
    @feedback = @course.feedbacks.find(params[:id])
    @feedback.visit_time+=1
    @feedback.save
  end
  
  def new
    @feedback = @course.feedbacks.build
  end

  def create
    @feedback = @course.feedbacks.build( feedback_params )
    @feedback.user_id=@user.id 
    @feedback.point_get = @adminparam.point_get_feedback
    if @feedback.save
      redirect_to course_feedbacks_url(@course)
      @user.rank+=@adminparam.point_get_feedback
      @user.maxrank+=@adminparam.point_get_feedback
      @user.save
    else
      render :action => :new
    end 
  end

  def edit
    @feedback = @course.feedbacks.find(params[:id])
  end

  def update
    @feedback = @course.feedbacks.find(params[:id])
    if @feedback.update(feedback_params)
       redirect_to course_feedbacks_url(@course)
    else
       render :action => :edit
    end 
  end

  def destroy
    @feedback = @course.feedbacks.find(params[:id])
    
    if @feedback.user != @user
      @feedback.user.rank-=@adminparam.point_get_feedback
      @feedback.user.save
    else
      if @feedback.point_get
        @user.rank-=@feedback.point_get
        @user.maxrank-=@feedback.point_get
        @user.save
      end
    end
    @feedback.destroy
    redirect_to course_feedbacks_url(@course)
  end

  protected
  
  def find_course
    @course = Course.find(params[:course_id])
  end
   
  def find_adminparam
    @adminparam = Adminparam.first
  end
  
  def find_user
    @user = current_user
  end

  def feedback_params
    params.require(:feedback).permit(:content,:year,:rating,:lecture_way,:partitioning,:test_homework,:other)
  end
  
  def user_confirm
     @course = Course.find(params[:course_id])
     if current_user.is_admin < 0
         flash[:alert] = t("Your account has not been approved by the administrator")
         redirect_to course_url(@course)
     end
       
  end
end
