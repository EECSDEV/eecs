class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :only => [ :show, :edit, :update, :destroy]
  before_action :set_user 
	
  def index
    @button_style = ["","btn btn-link","btn btn-link","btn btn-link","btn btn-link","btn btn-link","btn btn-link"]
    @year_list= ["","Freshman","Sophomore","Junior and Senior","Graduate","Foreign Language","General Knowledge"]
    if params[:keyword] and not params[:keyword] == ''
        @courses = Course.where( [ "name like ? OR instructor like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ] ).order('grade').page(params[:page]).per(1000)
	@result = "#{@courses.count} results matching keyword ' #{params[:keyword]} '"
    elsif params[:grade]
        @courses = Course.where(:grade => params[:grade]).order('name').page(params[:page]).per(10)
        @button_style[params[:grade].to_i] = "btn btn-info"
    else
        @courses = Course.where(:grade => 1).order('name').page(params[:page]).per(10)
        @button_style[1] = "btn btn-info"
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course=Course.new(course_params)
    #@course.save
    
    if @course.save
      redirect_to courses_url
    else
      render :action => :new
    end
    
    #redirect_to courses_url
  end
  
  def show
    #@course = Course.find(params[:id])
    grade_selector=['','Freshman','Sophomore','Junior and Senior','Graduate','Foreign Language','General Knowledge']
    @average_rate = 0
    if not @course.feedbacks.count == 0 
        @average_rate = @course.feedbacks.average(:rating)
    end
    @grade = grade_selector[@course.grade]
  end
  
  def destroy
    #@course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end

  def edit
    #@course = Course.find(params[:id])
  end
  
  def update
    #@course = Course.find(params[:id])
    #@course.update(course_params)
    
    if @course.update(course_params)
      redirect_to courses_url(@course)
    else
      render :action => :edit
    end
   
    #redirect_to courses_url(@course)
  end
  
  private

  def course_params
    params.require(:course).permit(:name, :instructor, :grade, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end
  def set_user
    @user = current_user 
  end
end
