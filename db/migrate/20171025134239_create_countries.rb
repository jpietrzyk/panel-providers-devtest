class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code, limit: 2, null: false
      t.references :panel_provider, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :countries, :panel_providers
  end
end
