class CreateGoodsItems < ActiveRecord::Migration
  def change
    create_table :goods_items do |t|
      t.integer :good_id
      t.integer :order_id

      t.timestamps
    end
  end
end
