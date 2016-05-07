class AddUserRefToAcademiaTakings < ActiveRecord::Migration
  def change
    add_reference :academia_takings, :user, index: true, foreign_key: true
  end
end
