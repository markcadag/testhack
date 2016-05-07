class AddLikersCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :likers_count, :integer, :default => 0
  end
end
