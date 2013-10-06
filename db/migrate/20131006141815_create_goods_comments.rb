class CreateGoodsComments < ActiveRecord::Migration
  def change
    create_table :goods_comments do |t|
      t.integer :user_id
      t.integer :good_id
      t.string :body_html
      t.boolean :public
      t.timestamps
    end
  end
end
