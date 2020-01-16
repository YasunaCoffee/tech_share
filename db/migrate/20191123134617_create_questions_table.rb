class CreateQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :curriculum, null: false
      t.timestamps
    end
  end
end
