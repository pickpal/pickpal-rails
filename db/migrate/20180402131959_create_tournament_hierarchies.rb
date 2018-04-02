class CreateTournamentHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :tournament_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "tournament_anc_desc_idx"

    add_index :tournament_hierarchies, [:descendant_id],
      name: "tournament_desc_idx"
  end
end
