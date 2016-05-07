class CreateTestTakings < ActiveRecord::Migration
  def change
    create_table :test_takings do |t|

      t.timestamps null: false
    end
  end
end
