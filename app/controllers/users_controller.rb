class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #Try to save it
    if @user.save 
      flash[:notice] = "User created correctly"
      redirect_to user(@user.id)
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  def show
    @users = User.last_created_users(30)
  end

  def destroy
    user = User.find params[:user_id]
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
