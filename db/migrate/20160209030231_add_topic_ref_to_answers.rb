class AddTopicRefToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :topic, index: true, foreign_key: true
  end
end
