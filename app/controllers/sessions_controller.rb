class SessionsController < ApplicationController
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
    end
  end

  def destroy

  end

end
