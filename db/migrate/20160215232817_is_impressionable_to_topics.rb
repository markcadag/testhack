class IsImpressionableToTopics < ActiveRecord::Migration
  def change  
  	add_column :topics, :cached_views_count, :integer, :default => 0
  end
end
