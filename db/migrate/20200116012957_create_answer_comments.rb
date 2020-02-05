class CreateAnswerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_comments do |t|
      t.text :content, null: false
      t.references :answer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
