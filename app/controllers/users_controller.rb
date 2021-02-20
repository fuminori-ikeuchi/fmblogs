class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    
  end

  

  def update
    
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールは更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールは更新されませんでした'
      render :edit
    end
  end
  
  
  
  
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page]).order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :img, :introduce)
  end
  
  
  def correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url
    end
  end
  
  
end



