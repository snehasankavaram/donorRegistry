class UsersController < ApplicationController

	def create
		if User.find_by(username: params[username]) == nil
			@new_user = User.new(username: params[:username], password: params[:password])
			@new_user.save
		end

		head :ok
	end

	def show
 		@user = User.find_by(username: params[:username])
     	render json: { user: @user }
	end
end
