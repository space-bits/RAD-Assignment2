module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end


  def current_user
    # assign the current user if one exists in the database matching the username stored in the session
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # if the current user is set then return true
  def logged_in?
    !current_user.nil?
  end

  # delete the user id fom session and set current user nil
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
