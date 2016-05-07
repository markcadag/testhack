class RemoveUserIdToAcademia < ActiveRecord::Migration
  def change
  	remove_column  :academia, :user_id
  end
end
