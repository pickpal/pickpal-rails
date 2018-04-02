class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.integer :parent_id
      t.string :name
      t.string :type
      t.jsonb :data
      t.timestamps
    end

    add_index :tournaments, [:parent_id, :name, :type]
  end
end
