class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :subject
      t.string :content
      t.references :user

      t.timestamps null: false
    end
  end
end
