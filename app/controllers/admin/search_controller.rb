class Admin::SearchController < ApplicationController


  def search
    @range = params[:range]

    if @range == "1"
      @users = User.looks(params[:search], params[:word])
    else
      @memos = Memo.looks(params[:search], params[:word])
    end
    
  end
  
  def destroy
    User.find(params[:id]).delete
    redirect_to admin_users_path
  end
  
  def user_params
　  params.require(:user).permit(:name, :introduction, :image)
  end

end

