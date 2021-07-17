class Admin::UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
end

def destroy
 User.find(params[:id]).delete
 redirect_to admin_users_path
end

def user_params
    params.require(:user).permit(:name, :introduction, :image)
end

end
