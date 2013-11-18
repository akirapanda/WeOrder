class CreateSendMails < ActiveRecord::Migration
  def change
    create_table :send_mails do |t|
      t.string :type
      t.string :receivers
      t.string :content
      t.boolean :done
      t.timestamps
    end
  end
end