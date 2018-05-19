class CommentsController < ApplicationController
  # don't require login to view comments
  skip_before_action :require_login, only: [:show, :show_top_20]
  # TODO: Link a comment to a user id that posted it

  # when creating a new comment, attach it to a articles id and
  # redirect to the articles article
  def create
    @article = Article.find(params[:article_id])
    if(@comment = @article.comments.create!(comment_params))
      # format.html { redirect_to @article, notice: 'Comment added!' }
      # format.json { render :show, status: :created, location: @article }
      redirect_to @article
    else
      format.html { render :show }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end

  # GET /comments
  # GET /comments.json
  def index
    # only get the 20 most recent comments
    @comments = Comment.all#.limit(20).order(:created_at).reverse
  end

  # may be unnecesary
  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # decalre a new private method to allow that a comment requires a body
  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
