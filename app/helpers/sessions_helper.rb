module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    # assign the current user if one exists in the database matching the username stored in the session
    @current_user ||= User.find_by(username: session[:username])
  end

  # if the current user is set then return true
  def logged_in?
    !current_user.nil?
  end
end
