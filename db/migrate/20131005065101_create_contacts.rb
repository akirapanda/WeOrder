class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.string :zipcode
      t.string :home_phone
      t.string :mobile_phone
      t.string :name

      t.timestamps
    end
  end
end
