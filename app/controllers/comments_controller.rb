class CommentsController < ApplicationController
  # TODO: Link a comment to a user id that posted it
  def create
    # when creating a new comment, attach it to a post id and
    # redirect to the post
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to @post
  end

  # decalre a new private method to allow that a comment requires a body
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
