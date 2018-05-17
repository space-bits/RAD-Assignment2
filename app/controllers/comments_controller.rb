class CommentsController < ApplicationController
  # TODO: Link a comment to a user id that posted it

  # when creating a new comment, attach it to a news id and
  # redirect to the news article
  def create
    # @user = User.find(params[:user_id])
    @news = News.find(params[:news_id])
    @comment = @news.comments.create!(comment_params)
    redirect_to @news
  end

  def show
    @comments = Comment.all
    
  end

  # decalre a new private method to allow that a comment requires a body
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
