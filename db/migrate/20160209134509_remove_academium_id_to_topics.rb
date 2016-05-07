class RemoveAcademiumIdToTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :academium_id, :integer
  end
end
