class Public::TagsController < ApplicationController

  def show
    @memo =  Memo.tagged_with(params[:id])
  end
end
