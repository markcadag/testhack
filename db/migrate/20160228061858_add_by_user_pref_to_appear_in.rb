class AddByUserPrefToAppearIn < ActiveRecord::Migration
  def change
    add_reference :appear_ins, :user, index: true, foreign_key: true
  end
end
