class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :theory, null: false
      t.text :action, null: false
      t.text :tip, null: false
      t.references :question, null: false,foreign_key: true
    end
  end
end
