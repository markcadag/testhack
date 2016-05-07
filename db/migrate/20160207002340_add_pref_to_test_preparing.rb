class AddPrefToTestPreparing < ActiveRecord::Migration
  def change
  	  add_reference :test_preparings, :user, index: true, foreign_key: true
  	  add_reference :test_preparings, :course, index: true, foreign_key: true
  end
end
