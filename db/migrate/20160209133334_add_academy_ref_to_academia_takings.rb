class AddAcademyRefToAcademiaTakings < ActiveRecord::Migration
  def change
    add_reference :academia_takings, :academy, index: true, foreign_key: true
  end
end
