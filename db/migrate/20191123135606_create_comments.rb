class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :answer, null: false, foreign_key: true
    end
  end
end
