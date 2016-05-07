class AddIsPreparingForToTestPreparings < ActiveRecord::Migration
  def change
    add_column :test_preparings, :primary_preparing, :boolean , default: false
  end
end
