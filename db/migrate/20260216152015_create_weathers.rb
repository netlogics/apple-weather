class CreateWeathers < ActiveRecord::Migration[8.0]
  def change
    create_table :weathers do |t|
      t.json :forecast
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
