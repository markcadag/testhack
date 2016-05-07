class AddCurrentAcademyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_academy, :string
  end
end
