class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :only => [ :show, :edit, :update, :destroy]
  before_action :set_user
	
  def index
    @key = ""
    @stype = ""
    @is_searching = 0
    @tag_style = ["","course_tag_other","course_tag_other","course_tag_other","course_tag_other","course_tag_other","course_tag_other"]
    @tag_z_index = [ 0,"6","5","4","3","2","1"]
    @year_list= ["","Freshman","Sophomore","Junior and Senior","Graduate","Foreign Language","General Knowledge"]
    if params[:keyword] and not params[:keyword] == ''
      if params[:search_type] == 'name'
        @courses = Course.where( [ "name like ?", "%#{params[:keyword]}%" ] ).order('grade').page(params[:page]).per(1000)
      elsif params[:search_type] == 'instructor'
        @courses = Course.where( [ "instructor like ?", "%#{params[:keyword]}%" ] ).order('grade').page(params[:page]).per(1000)
      end
        @key = params[:keyword]
        @stype = params[:search_type]
        @is_searching = 1
    elsif params[:grade]
        @courses = Course.where(:grade => params[:grade]).order('name').page(params[:page]).per(10)
        @tag_style[params[:grade].to_i] = "course_tag_select"
	@tag_z_index[params[:grade].to_i] = "10"
    else
        @courses = Course.where(:grade => 1).order('name').page(params[:page]).per(10)
        @tag_style[1] = "course_tag_select"
	@tag_z_index[1] = "10"
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
    grade_selector=['','Freshman','Sophomore','Junior and Senior','Graduate','Foreign Language','General Knowledge']
    @average_rate = 0
    if not @course.feedbacks.count == 0 
        @average_rate = @course.feedbacks.average(:rating)
    end
    @grade = grade_selector[@course.grade]
    @hot_article = @course.feedbacks.order("visit_time DESC").first
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
