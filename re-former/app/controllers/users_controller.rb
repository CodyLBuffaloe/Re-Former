class UsersController < ApplicationController

  def new
    @user = User.new

  end


  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
    #@user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = user_params[:name]
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    if @user.save
      redirect_to new_user_path
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
