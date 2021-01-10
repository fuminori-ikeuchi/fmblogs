#class SearchesController < ApplicationController
class Posts::SearchesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @posts = Post.search(params[:keyword]).order(created_at: :desc)
  end
end

