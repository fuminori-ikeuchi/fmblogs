class CommentsController < ApplicationController
  before_action :require_user_logged_in
  # before_action :correct_user, only: [:destroy]

    
    
  def create
    comment = Comment.create(comment_params)
     redirect_to "/posts/#{comment.post.id}"
  end
  
  def destroy
    
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    
    
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
  
  # def correct_user
  #   @commentsss = current_user.comments.find_by(id: params[:id])
  #   unless @commentsss
  #     redirect_to root_url
  #   end
  # end




end
