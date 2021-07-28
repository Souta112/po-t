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

def update
   @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully"
       redirect_to memos_path(@user.id)
    else
      render "edit"
    end
end

def user_params
    params.require(:user).permit(:name, :introduction, :image)
end


end
