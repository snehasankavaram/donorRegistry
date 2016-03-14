module SessionsHelper
	def log_in(user)
   	session[:user_id] = user.id
  end

  def log_in_org(org)
    session[:user_id] = org.id
  end

  # Returns the current logged-in user (if any).
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_org
    @current_org ||= Organization.find_by(id: session[:user_id])
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def user_logged_in?
    !current_user.nil?
  end

  def org_logged_in?
    !current_org.nil?
  end
end
