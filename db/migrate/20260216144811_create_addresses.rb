class CreateAddresses < ActiveRecord::Migration[8.0]
  def up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.decimal :lat, precision: 7, scale: 4
      t.decimal :long, precision: 7, scale: 4

      t.timestamps
    end

    add_index :addresses, [:street, :city, :state, :zip], unique: true
    add_index :addresses, [:city, :state]
    add_index :addresses, :zip, unique: true
  end

  def down
    drop_table :addresses
  end
end
