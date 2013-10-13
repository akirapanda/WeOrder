class AddReplyTypeIntoKeywords < ActiveRecord::Migration
  def self.up
    add_column :keywords, :reply_type, :string    
  end

  def self.dowm
    remove_column :keywords , :reply_type
  end
end
