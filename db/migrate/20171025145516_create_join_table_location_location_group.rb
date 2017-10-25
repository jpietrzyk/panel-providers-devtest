class CreateJoinTableLocationLocationGroup < ActiveRecord::Migration
  def change
    create_join_table :locations, :location_groups do |t|
      t.index [:location_id, :location_group_id], name: 'l_id_lg_id'
      t.index [:location_group_id, :location_id], name: 'lg_id_l_id'
    end
  end
end
