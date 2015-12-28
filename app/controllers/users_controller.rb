class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.where([ "is_admin <= ?", 1])
	end
	def show
		if params[:id]
	        @user= User.find(params[:id])
        end
	end

 	def hero
        @key = ""
		@stype = ""
        if current_user.is_admin == 2
            @notyet_confirm_users = User.where([ "is_admin == ?", -1])
        end
        if params[:keyword]
			case params[:search_type] 
				when "all"
					@users = User.where([ "is_admin <= ?", 1]).where( [ "first_name like ? OR nick_name like ? OR last_name like ? OR class_year like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ] ).page(params[:page]).per(2)
				when "nick"
					@users = User.where([ "is_admin <= ?", 1]).where( [ "nick_name like ?", "%#{params[:keyword]}%"]).page(params[:page]).per(10)
				when "first"
					@users = User.where([ "is_admin <= ?", 1]).where( [ "first_name like ?", "%#{params[:keyword]}%"]).page(params[:page]).per(10)
				when "last"
					@users = User.where([ "is_admin <= ?", 1]).where( [ "last_name like ?", "%#{params[:keyword]}%"]).page(params[:page]).per(10)
				when "classyear"
					@users = User.where([ "is_admin <= ?", 1]).where( [ "class_year like ?", "%#{params[:keyword]}%"]).page(params[:page]).per(10)
				else
					@users = User.where([ "is_admin <= ?", 1]).where( [ "first_name like ? OR nick_name like ? OR last_name like ? OR class_year like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ] ).page(params[:page]).per(10)
            end
			@key = params[:keyword]
			@stype = params[:search_type]
            @search = 1
        else
            @users = User.where([ "is_admin <= ?", 1]).order('maxrank DESC').limit(10)
            @search = 0
        end
	end

    def assign
        @user = User.find(params[:id])
        @user.is_admin = 1
        @user.save
        redirect_to :action => :show, :id => @user.id
    end
        
    def unassign
   	    @user = User.find(params[:id])
        @user.is_admin = 0
        @user.save
        redirect_to :action => :show, :id => @user.id
    end
  
    def confirm
        @user = User.find(params[:id])
        @user.is_admin = 0
        @user.save
        redirect_to :action => :hero
    end

    def add_point
        @user = User.find(params[:id])
        @user.rank += params[:add_point].to_i
        @user.maxrank += params[:add_point].to_i
        @user.save
        redirect_to :action => :show, :id => @user.id
    end

	def manage
		@user = User.find(params[:id])
		
		@type_list= ["Midterm","Final","Quiz","Homework","Project","others"]
	end
  

end
