class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    # Q3: what does this mean?
    @comment.account_id = current_account.id
    #Q4: why is this needed?
    if @comment.save
      redirect_to community_post_path(@comment.post.community_id, @comment.post)
      #Q6: is it just like partial?
    else
      #unable to save
    end
    # respond_to do |format|
    #   format.js {
    #     if @comment.save
    #       render "comments/create"
    #       #Q6: is it just like partial?
    #     else
    #       #unable to save
    #     end
    #   }
    # end
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id)
    # Q5: why isn't here ":account_id"
  end
end