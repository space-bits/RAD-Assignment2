class ItemsController < ApplicationController
  skip_before_action :require_login

  def show
    if Article.exists?(params[:id])
      @type = "news"
      render json: Article.find(params[:id])
    elsif Comment.exists?(params[:id])
      # ['article_id LIKE ?', "%#{params[:id]}%"]
      # possibly we have to rely on the article_id
      @type = "comment"
      render json: Comment.find(params[:id])
    else
      render json: "{ \"errors\" : {\"message\" : \"Item doesn\'t exist\"} }"
    end
  end

end
