class Public::MemosController < ApplicationController
  def index
    @memos =  Memo.where(user_id: current_user.id)

  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
     @memo = Memo.new
  end

  def edit
     @memo = Memo.find(params[:id])
    unless @memo.user_id == current_user.id
    redirect_to memos_path
    end
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to memo_path
    else
      render "edit"
    end
  end

  def create
   @memo = Memo.new(memo_params)
   @memo.user_id = current_user.id #メモを作った時に作ったユーザーと紐づける保存（他人に見せない時に作成）
   @memo.save
     redirect_to memos_path
  end

  private
  def memo_params
   params.require(:memo).permit(:title, :text, :tags_id, :like_id, :all_reads)
  end

end
