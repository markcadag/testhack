class RemoveAcademiumIdFromAcademiaTakings < ActiveRecord::Migration
  def change
    remove_column :academia_takings, :academium_id, :integer
  end
end
