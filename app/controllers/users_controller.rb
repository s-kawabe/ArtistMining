class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :pass, :update]

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

  def show
  end

  def edit 
  end

  def pass
  end

  def update

    # パスワード変更時の現在パスワード一致チェック
    if params[:user][:password_before]
      unless @user.authenticate(params[:user][:password_before])
        
        flash.now[:danger] = '現在のパスワードが誤っています'
        render :pass
        return
      end
    end

    if @user.update(user_params)
      flash[:success] = 'ユーザ情報を変更しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ情報の変更に失敗しました'
      render :edit
    end

  end

 private

  def user_params
    params.require(:user).permit(:name, :email, :user_image, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end