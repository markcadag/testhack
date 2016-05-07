class AddAcademiumRefToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :academium, index: true, foreign_key: true
  end
end
