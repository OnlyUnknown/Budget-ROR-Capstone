class CreateEntitiesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :entities_groups, id: false do |t|
      t.belongs_to :entity
      t.belongs_to :group

      t.timestamps
    end
    add_index :entities_groups, [:entity_id, :group_id], unique: true
  end
end
