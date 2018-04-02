class CreateCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :competitors do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.jsonb :data

      t.timestamps
    end
    add_index :competitors, [:type, :name], unique: true
  end
end
