class UpdrateWeixinMessage < ActiveRecord::Migration
  def change
    
    drop_table :weixin_messages
    drop_table :weixin_customers
    
    create_table :weixin_messages do |t|
      t.string :from_user
      t.string :to_user
      t.string :type
      t.datetime :create_time
      t.string :text_content
      t.string :msg_id
      t.string :event
      t.timestamps
    end    
    
    create_table :weixin_users do |t|
      t.string :open_id
      t.integer :user_id
      t.string :name
      t.string :group
      t.text :note
      t.timestamps  
    end
    
    add_index :weixin_users, :open_id,  :unique => true
  end
end
