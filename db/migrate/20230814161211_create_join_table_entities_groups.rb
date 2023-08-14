class CreateJoinTableEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :catogorization do |t|
      t.references :group, index: true, foreign_key: true
      t.references :entity, index: true, foreign_key: true
    end
  end
end
