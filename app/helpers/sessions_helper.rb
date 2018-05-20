module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # set the cookie for the user to be encrypted for the id, and
  # set the remember_token to that of the users
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:rememberToken] = user.rememberToken
  end

  def current_user
    # assign the current user if one exists in the database
    # matching the username stored in the session
    # set the uid to the one stored in the session if it exists
    if(user_id = session[:user_id])
      # if the session has a user id set then
      @current_user ||= User.find_by(id: user_id)
    elsif( user_id = cookies.signed[:user_id] )
      user = User.find_by(id: user_id)
      # log the user in if they exist in the db and set the current_user
      # to be the one we found in the db from the id stored in the cookie
      log_in user
      if user && user.authenticated?(cookies[:rememberToken])
        @current_user = user
      end
    end
  end

  # if the current user is set then return true
  def logged_in?
    !current_user.nil?
  end

  # delete the user id fom session and set current user nil
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end
