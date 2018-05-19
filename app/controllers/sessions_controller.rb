class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      # generate an error message

      redirect_to login_url
    end
  end

  def destroy
    log_out if !session[:user_id].nil?
    redirect_to root_url
  end
end
