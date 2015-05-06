class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all 
	
	end
	def show 
	  
          if params[:id]
	  	@user =User.find(params[:id])
          else 
                @user = current_user
          end
	end

        #def show
	#  @user =User.find(params[:id])
	#end

        def hero
                @users=User.all.order("rank ASC")
        end

end