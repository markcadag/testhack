class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
