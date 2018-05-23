class ItemsController < ApplicationController
  skip_before_action :require_login

  def show
    if Article.exists?(params[:id])
      render json: Article.find(params[:id])
    elsif Comment.exists?(params[:id])
      render json: Comment.find(params[:id])
    else
      render json: "{ \"errors\" : {\"message\" : \"Item doesn\'t exist\"} }"
    end
  end

end
