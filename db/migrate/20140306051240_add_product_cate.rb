class AddProductCate < ActiveRecord::Migration
  def change
    create_table :product_cates do |t|
      t.string :super_cate
      t.string :name
      t.text :note
      t.integer :shop_id
      t.timestamps
    end
    add_column :products, :product_cate_id,:integer
    
  end
end
