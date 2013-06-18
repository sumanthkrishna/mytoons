class CommentsController < ApplicationController
  before_filter :authenticate_user!
  # create a comment and bind it to an toon and a user
  def create
    @toon = Toon.find(params[:toon_id])
    @comment = @toon.comments.build(params[:comment])
    @comment.user = current_user
      if @comment.save
        redirect_to(@toon, :notice => 'Comment was successfully created.') 
      else
        redirect_to(@toon) 
      end
  end

  # remove a comment
  def destroy
    @comment = current_user.comments.find(params[:id])
    @toon = Toon.find(params[:toon_id])
    @comment.destroy
    redirect_to @toon
  end
end
