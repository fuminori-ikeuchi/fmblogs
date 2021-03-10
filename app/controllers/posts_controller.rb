class PostsController < ApplicationController
  before_action :require_user_logged_in 
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(id: :desc).page(params[:page]).per(8)
    @posts = current_user.posts.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '記事を投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    
    
  end

  def update
    if @post.update(post_params)
      flash[:success] = '記事を編集しました'
      redirect_to @post
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '記事を削除しました。'
    redirect_to root_url
  end
  
  def likers
    @post = Post.find(params[:id])
    @likers = @post.likers.page(params[:page])

  end
  
  
  
  
  private

  def post_params
    params.require(:post).permit(:content, :image, :title)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end

