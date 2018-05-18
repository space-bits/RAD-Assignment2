class CommentsController < ApplicationController
  # don't require login to view comments
  skip_before_action :require_login, only: [:show, :show_top_20]
  # TODO: Link a comment to a user id that posted it

  # when creating a new comment, attach it to a articles id and
  # redirect to the articles article
  def create
    # @user = User.find(params[:user_id])
    @articles = Article.find(params[:articles_id])
    @comment = @articles.comments.create!(comment_params)
    redirect_to @articles
  end

  # GET /comments
  # GET /comments.json
  def index
    # only get the 20 most recent comments
    @comments = Comment.all # "created_at desc", :limit => 20)
  end

  # may be unnecesary
  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  def show_top_20
    # write an active record query to return the last 20 or so in terms of date created
    @comments = Comment.all.first
    # render a view with top 20. maybe just rewrite the index to do this
    redirect_to comments_url
  end

  # decalre a new private method to allow that a comment requires a body
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
