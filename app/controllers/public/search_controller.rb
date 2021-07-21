class Public::SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Memo.looks(params[:search], params[:word])
    end
  end
end

