class Public::UsersController < ApplicationController

def index
   @users = User.all
end

def edit
  @user = User.find(params[:id])
end

def show
 @user = User.find(params[:id])
 @memo = @user.memos
end

def user_params
    params.require(:user).permit(:name, :introduction, :image)
end


end
