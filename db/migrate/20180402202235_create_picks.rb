class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.belongs_to :picker, foreign_key: false, index: false, null: false
      t.belongs_to :match, foreign_key: true, index: false, null: false
      t.belongs_to :match_competitor, foreign_key: true, null: false

      t.timestamps
    end
    add_index :picks, [:picker_id, :match_id], unique: true
    add_foreign_key :picks, :reddit_users, column: :picker_id
  end
end
