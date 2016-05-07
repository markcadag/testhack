class AddNameToAcademies < ActiveRecord::Migration
  def change
    add_column :academies, :name, :string
  end
end
