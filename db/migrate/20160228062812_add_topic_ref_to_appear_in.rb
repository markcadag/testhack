class AddTopicRefToAppearIn < ActiveRecord::Migration
  def change
    add_reference :appear_ins, :topic, index: true, foreign_key: true
  end
end
