class CreateAcademies < ActiveRecord::Migration
  def change
    create_table :academies do |t|

      t.timestamps null: false
    end
  end
end
