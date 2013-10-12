class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :cate
      t.string :keywords
      t.string :reply_content
      t.timestamps
    end
  end
end
