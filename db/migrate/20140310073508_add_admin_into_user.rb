class AddAdminIntoUser < ActiveRecord::Migration
  def change
    create_table "shops", force: true do |t|
      t.string   "name"
      t.string   "weixin_token"
      t.string   "short_name"
      t.string   "cate_type"
      t.text     "description"
      t.integer  "user_id"
      t.integer  "level"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_column :users, :shoping_id,:integer
  end
end
