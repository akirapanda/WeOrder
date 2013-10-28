class ChangeStringToTextGoods < ActiveRecord::Migration
  def change
    change_column :goods, :body, :text
    change_column :goods, :body_html, :text
  end
end
