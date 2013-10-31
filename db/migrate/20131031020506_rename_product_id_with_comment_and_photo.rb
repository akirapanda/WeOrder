class RenameProductIdWithCommentAndPhoto < ActiveRecord::Migration
  def change
    rename_column :photos, :good_id,:product_id
    rename_column :goods_comments, :good_id,:product_id
    rename_table :goods_comments, :product_comments
    
  end
end
