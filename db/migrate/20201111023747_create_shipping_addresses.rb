class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :municipality, null:false
      t.string :street_number, null:false
      t.string :building_name, null:false
      t.string :telephone_number, null:false
      t.references :record, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
