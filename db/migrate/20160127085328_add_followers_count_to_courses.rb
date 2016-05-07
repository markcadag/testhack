class AddFollowersCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :followers_count, :integer, :default => 0
  end
end
