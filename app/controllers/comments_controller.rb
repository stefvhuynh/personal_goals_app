class CommentsController < ApplicationController
  before_filter :require_logged_in!

  def create
    @comment = current_user.made_comments.build(comment_params)

    if @comment.save
      redirect(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect(@comment)
    end
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:content, :commenter_id, :commentable_id, :commentable_type)
  end

  def redirect(comment)
    if comment.commentable_type == "Goal"
      redirect_to user_goal_url(
        comment.commentable.user, comment.commentable
      )
    elsif comment.commentable_type == "User"
      redirect_to user_url(comment.commentable)
    end
  end
end
