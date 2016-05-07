class AddAcademyRefToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :academy, index: true, foreign_key: true
  end
end
