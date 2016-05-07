class AddDocumentToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :document, :string
  end
end
