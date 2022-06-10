class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    # Q3: what does this mean?
    @comment.account_id = current_account.id

    respond_to do |format|
      format.js {
        if @comment.save
          render "comments/create"
        else
          #unable to save
        end
      }
    end
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end