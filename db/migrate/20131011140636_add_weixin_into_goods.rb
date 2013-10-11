class AddWeixinIntoGoods < ActiveRecord::Migration
  def self.up
    add_column :goods, :weixin_url, :string    
  end

  def self.dowm
    remove_column :goods , :weixin_url
  end
end
