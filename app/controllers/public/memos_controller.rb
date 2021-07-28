class Public::MemosController < ApplicationController
  def index

    #もしもパラムスにタグの情報があったならば
    #タグに関連した情報を@memosに入れる
    #if !params[:tag].nil?
    #@memos =  Memo.where(tag_list: params[:tag])#自分の投稿一覧
    #else
    #タグに関連した情報がなければ通常のindex表示用のデータを取得する
    @memos =  Memo.where(user_id: current_user.id)#自分の投稿一覧
    #end
  end

  def show
    @memo = Memo.find(params[:id])
    @tags = @memo.tag_counts_on(:tags)    # 投稿に紐付くタグの表示
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

    if @memo.save
     redirect_to memos_path
    else
    render "new"
    end
  end

  def destroy
    Memo.find(params[:id]).delete
    redirect_to memos_path
  end

  private
  def memo_params
   params.require(:memo).permit(:title, :text, :tag_list, :like_id, :all_reads)
  end

end
