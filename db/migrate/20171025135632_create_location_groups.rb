class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name, null: false
      t.references :country, index: true, null: false
      t.references :panel_provider, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :location_groups, :countries
    add_foreign_key :location_groups, :panel_providers
  end
end
