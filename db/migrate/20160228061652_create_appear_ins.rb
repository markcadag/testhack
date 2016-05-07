class CreateAppearIns < ActiveRecord::Migration
  def change
    create_table :appear_ins do |t|

      t.timestamps null: false
    end
  end
end
