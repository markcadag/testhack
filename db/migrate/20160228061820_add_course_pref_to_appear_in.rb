class AddCoursePrefToAppearIn < ActiveRecord::Migration
  def change
    add_reference :appear_ins, :course, index: true, foreign_key: true
  end
end
