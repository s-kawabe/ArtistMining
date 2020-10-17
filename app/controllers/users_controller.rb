class UsersController < ApplicationController
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
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def pass
  end

  def update
    @user = User.find(params[:id])

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

   def user_edit_params
     params.require(:user).permit(:name, :email, :user_image)
   end
end