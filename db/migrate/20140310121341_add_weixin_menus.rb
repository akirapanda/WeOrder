class AddWeixinMenus < ActiveRecord::Migration
  def change
    create_table "weixin_menus" do |t|
      t.integer :shop_id
      t.integer :user_id
      t.string :name
      t.text :note
      t.timestamps
    end
    
    create_table "weixin_buttons"  do |t|
      t.integer :weixin_menu_id
      t.integer :position
      
      t.string :button_type
      t.string :name
      t.string :key
      t.string :url
      t.timestamps
    end  
    
    create_table "weixin_sub_buttons" do |t|
      t.integer :weixin_button_id
      t.integer :position
      
      t.string :button_type
      t.string :name
      t.string :key
      t.string :url
      t.timestamps
    end
  end
end
