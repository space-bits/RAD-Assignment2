class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      redirect_to(@user)
    else
      # Create an error message.
      respond_to do |format|
        format.html { redirect_to login_url, notice: 'Login failed.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy

  end

  private
    def logged_in?

    end
end
