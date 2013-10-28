class ChangeStringToTextMail < ActiveRecord::Migration
  def change
    change_column :send_mails, :content, :text
  end
end
