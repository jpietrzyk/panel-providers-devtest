class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name, null: false
      t.integer :external_id
      t.integer :parent_id
      t.string :secret_code
      t.references :panel_provider, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :target_groups, :panel_providers
  end
end
