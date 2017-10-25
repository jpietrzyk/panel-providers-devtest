class CreateJoinTableCountryTargetGroup < ActiveRecord::Migration
  def change
    create_join_table :countries, :target_groups do |t|
      t.index [:country_id, :target_group_id], name: 'c_id_tg_id'
      t.index [:target_group_id, :country_id], name: 'tg_id_c_id'
    end
  end
end
