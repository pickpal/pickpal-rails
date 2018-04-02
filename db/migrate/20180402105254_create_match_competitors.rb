class CreateMatchCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :match_competitors do |t|
      t.belongs_to :match, foreign_key: true, index: false
      t.belongs_to :competitor, foreign_key: true, index: false
      t.integer :ordinal, null: false, default: 0
      t.jsonb :data
      t.timestamps
    end
    add_index :match_competitors, [:match_id, :competitor_id], unique: true
  end
end
