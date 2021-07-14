class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
    t.string "title"
    t.text "text"
    t.integer "user_id"
    t.integer "tags_id"
    t.integer "like_id"
    t.boolean "all_reads"
      t.timestamps
    end
  end
end
