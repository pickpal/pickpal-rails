class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.belongs_to :tournament, foreign_key: true, index: false
      t.integer :ordinal, default: 0, null: false
      t.datetime :starts_at
      t.jsonb :data

      t.timestamps
    end
    add_index :matches, [:tournament_id, :ordinal]
  end
end
