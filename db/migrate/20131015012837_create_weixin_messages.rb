class CreateWeixinMessages < ActiveRecord::Migration
  def change
    create_table :weixin_messages do |t|
      t.string :from_user
      t.string :msgType
      t.string :msg
      t.timestamps
    end
  end
end
