class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page]).per(5)
    end
    @users = User.order(id: :desc).page(params[:page]).per(5)
  end
  
end
