class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :cover
      t.string :name
      t.string :content
      t.decimal :price
      t.string :unit

      t.timestamps
    end
  end
end
