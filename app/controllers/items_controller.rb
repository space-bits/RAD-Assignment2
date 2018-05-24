class ItemsController < ApplicationController
  skip_before_action :require_login
  skip_before_action :verify_authenticity_token


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

  # create a new news item if the fields are valid for eithenews or comment
  def create
    @user_id = get_user_id(params[:username])
    @item = Article.new(:by => params[:username], :url => params[:url], :title => params[:title]) unless !params[:type].eql?("news")
    if @item.save
      render json: @item, status: 200
    else
      render json: @item.errors, status: 400
    end
  end

end
