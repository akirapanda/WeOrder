class AddOriginWithProduct < ActiveRecord::Migration
  def change
    add_column :products,:is_recommend,:boolean
    add_column :products, :is_onsale,:boolean
  end
end
