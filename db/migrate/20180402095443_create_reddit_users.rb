class CreateRedditUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :reddit_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
