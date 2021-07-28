class Memo < ApplicationRecord
  belongs_to :user

acts_as_taggable   # acts_as_taggable_on :tags の省略

# 参)複数設定も可能↓
acts_as_taggable_on :skills, :interests  # @post.skill_list とかが使えるようになる

validates :title,length: { minimum: 1 }
validates :text, presence: true
# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @memo = Memo.where("title LIKE?","#{word}")



    elsif search == "partial_match"
      @memo = Memo.where("title LIKE?","%#{word}%")
    else
      @memo = Memo.all
    end
  end
  
end
