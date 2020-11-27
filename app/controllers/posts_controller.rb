class PostsController < ApplicationController
  before_action :require_user_logged_in 
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    #@user = post.user.find_by(params[:id])
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
    @post = Post.find(params[:id])
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
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
    
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

