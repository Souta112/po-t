class Public::SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @memos = Memo.looks(params[:search], params[:word])
    end
     @tags = ActsAsTaggableOn::Tag.all
    # タグの一覧表示
    if params[:tag]
      @memo = Memo.tagged_with(params[:tag])
    end
  end

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @memos = Memo.looks(params[:search], params[:word])
    end
  end
end

