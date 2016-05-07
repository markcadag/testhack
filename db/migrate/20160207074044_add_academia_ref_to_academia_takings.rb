class AddAcademiaRefToAcademiaTakings < ActiveRecord::Migration
  def change
    add_reference :academia_takings, :academium, index: true, foreign_key: true
  end
end
