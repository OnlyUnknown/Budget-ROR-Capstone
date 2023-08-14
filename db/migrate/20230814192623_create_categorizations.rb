class CreateCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

    end
  end
end
