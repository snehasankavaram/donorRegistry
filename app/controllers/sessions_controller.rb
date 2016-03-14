class SessionsController < ApplicationController
  def new
  end

  def newOrg
    render 'new_org'
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
    	log_in user

    	# redirect to page with logged in state
    	redirect_to '/organizations'
    else
      # Create an error message.
      flash[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def createOrg
    user = Organization.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in_org user

      # redirect to page with logged in state
      redirect_to '/orgs/registry'
    else
      # Create an error message.
      flash[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new_org'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def destroyOrg
    log_out
    redirect_to orgs_login_path
  end
end
