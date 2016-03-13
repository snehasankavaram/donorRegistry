class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
    	if @user.save
    		# change to redirect to logged in state page
    		log_in @user
      		redirect_to @user
    	else
      		render 'new'
      	end
    end

	def show
 		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def login
		@users = User.all
		render 'login'
	end

	private

	    def user_params
	      params.require(:user).permit(:name, :phone_number, :password,:location, :username)
    end

end
