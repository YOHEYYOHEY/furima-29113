class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,           null: false,foreign_key:true
      t.integer :postal_code,           null: false
      t.integer :prefecture_id,         null: false
      t.string :city,                   null: false
      t.integer :house_number,          null: false
      t.integer :building_name,         null: false
      t.string :phone_number,          null: false
      t.timestamps
    end
  end
end
