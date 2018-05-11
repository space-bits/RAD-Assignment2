class CommentsController < ApplicationController
  # TODO: Link a comment to a user id that posted it
  def create
    # when creating a new comment, attach it to a news id and
    # redirect to the news article
    @news = News.find(params[:News_id])
    @comment = @news.comments.create!(comment_params)
    redirect_to @news
  end

  # decalre a new private method to allow that a comment requires a body
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
