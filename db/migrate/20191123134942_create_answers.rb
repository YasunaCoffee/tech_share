class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :question, null: false,foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
