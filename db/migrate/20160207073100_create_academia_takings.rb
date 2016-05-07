class CreateAcademiaTakings < ActiveRecord::Migration
  def change
    create_table :academia_takings do |t|

      t.timestamps null: false
    end
  end
end
