class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CommentsHelper
  before_action :require_login, :except => [:index]

  def get_username(user)
    User.find(user.id).username
  end
end
