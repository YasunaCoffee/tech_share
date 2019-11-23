class CreateQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content, null:false
    end
  end
end
