class CreateCurriculums < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculums do |t|
      t.string :app, null: false
      t.string :phase, null: false
      t.string :url, null: false
    end
  end
end
