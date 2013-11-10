class AddWeixinCoverIntoShopping < ActiveRecord::Migration
  def change
    add_column :photos,:weixin_cover,:boolean,:default=>false
  end
end
