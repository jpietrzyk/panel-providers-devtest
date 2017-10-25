class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :external_id
      t.string :secret_code

      t.timestamps null: false
    end
  end
end
