class AddFieldsToTestTaking < ActiveRecord::Migration
	def change
	    add_column :test_takings, :user_id, :integer
	    add_column :test_takings, :course_id, :integer
	    add_column :test_takings, :source_id, :integer
  	end
end
