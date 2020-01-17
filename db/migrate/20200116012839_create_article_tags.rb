class CreateArticleTags < ActiveRecord::Migration[5.2]
  def change
    create_table :article_tags do |t|
        t.references :article, null: false, foreign_key: true
        t.references :simpletag, null: false, foreign_key: true
        t.timestamps
      t.timestamps
    end
  end
end
