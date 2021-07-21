class Memo < ApplicationRecord
  belongs_to :user

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @memo = Memo.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @memo = Memo.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @memo = Memo.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @memo = Memo.where("title LIKE?","%#{word}%")
    else
      @memo = Memo.all
    end
  end
  
end
