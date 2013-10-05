class AddBodyIntoGoods < ActiveRecord::Migration
  def self.up
    add_column :goods, :body, :string
    add_column :goods, :body_html, :string
  end
  
  def self.dowm
    remove_column :goods , :body
    remove_column :goods , :body_html
  end
end
