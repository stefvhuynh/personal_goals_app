class CommentsController < ApplicationController

  def create
    @comment = current_user.made_comments.build(comment_params)
    p comment_params
    p @comment

    if @comment.save
      if @comment.commentable_type == "User"
        redirect_to user_url(params[:commentable_id])
      elsif @comment.commentable_type == "Goal"
        goal = Goal.find(@comment.commentable_id)
        redirect_to user_goal_url(goal.user, goal)
      end

    else

      flash.now[:errors] = @comment.errors.full_messages
      if @comment.commentable_type == "User"
        redirect_to user_url(params[:commentable_id])
      elsif @comment.commentable_type == "Goal"
        goal = Goal.find(@comment.commentable_id)
        redirect_to user_goal_url(goal.user, goal)
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content,
      :commenter_id,
      :commentable_id,
      :commentable_type)
  end
end
