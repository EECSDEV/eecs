class CoursePastexamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course,:except => [:download]
  before_action :find_adminparam  
  before_action :user_confirm, :except => [:download]

  def index
    @type_list= ["Midterm","Final","Quiz","Homework","Project","others"]
    @pastexams = @course.pastexams.order("year").page(params[:page]).per(10)
    
  end
  
  def show
    @pastexam = @course.pastexams.find(params[:id])
  end

  def new
    @pastexam = @course.pastexams.build
  end

  def create
    @pastexam = @course.pastexams.build( pastexam_params )
    @pastexam.user_id = current_user.id
    @pastexam.point_get = @adminparam.point_get_pastexam
    if @pastexam.save
      redirect_to course_pastexams_url( @course )
      current_user.rank+=@adminparam.point_get_pastexam
      current_user.maxrank+=@adminparam.point_get_pastexam
      current_user.save
    else
      render :action => :new
    end
  end

  def edit
    @pastexam = @course.pastexams.find(params[:id])
  end

  def update
  @pastexam = @course.pastexams.find( params[:id] )

  if @pastexam.update( pastexam_params )
    redirect_to course_pastexams_url( @course )
  else
    render :action => :edit
  end

  end

  def destroy
    @pastexam = @course.pastexams.find( params[:id] )
    if @pastexam.user != current_user
      @pastexam.user.rank-=@adminparam.point_get_pastexam
      @pastexam.user.save
    else
      if @pastexam.point_get
        current_user.rank-=@pastexam.point_get
        current_user.maxrank-=@pastexam.point_get
        current_user.save
      end
    end
    path = getfilename(@pastexam,@course)
    if File.exist? path
    	FileUtils.rm(path)
    end
    @pastexam.destroy

    redirect_to course_pastexams_url( @course )
  end

  def download
    @pastexam = Pastexam.find( params[:id] )
    
    @course = @pastexam.course
    if current_user.rank < @adminparam.point_need_pastexam
        flash[:alert] = t("Points not enough")
	redirect_to course_pastexams_path(@course)
    else
	new_point = @pastexam.download_time+=1
        #@pastexam.save
	path = getfilename(@pastexam,@course)
	send_file path, :x_sendfile=>true
	current_user.rank -= @adminparam.point_need_pastexam
	current_user.save
	#@pastexam.update(:download_time => new_point)
    end
  end

  def block
    redirect_to root_url
  end

  protected

  def find_course
    @course = Course.find( params[:course_id] )
  end
   
  def find_adminparam
    @adminparam = Adminparam.first
  end

  def pastexam_params
	params.require(:pastexam).permit(:file ,:exam_type, :has_answer, :year,:which_time,:description)
  end

  def getfilename(pastexam,course)
    truename = ""
    filename = pastexam.file.url.split("/").last.split(".").first 
    l = pastexam.file.url.split(".").length
    if l == 1
      truename = filename + "#{pastexam.id}"
    else
      truename = filename +"#{pastexam.id}." + pastexam.file.url.split(".").last
    end
    year_list= ["","freshman","sophomore","juniorandsenior","graduate","language","general"]
    type_list= ["mid","final","quiz","hw","prj","others"]
    path = "#{Rails.root}/pastexam/#{year_list[course.grade]}/#{course.name}/#{course.instructor}/#{truename}"
    return path
  end

  def user_confirm
     @course = Course.find(params[:course_id])
     if current_user.is_admin < 0
         flash[:alert] = t("Your account has not been approved by the administrator")
         redirect_to course_url(@course)
     end
       
  end

end
