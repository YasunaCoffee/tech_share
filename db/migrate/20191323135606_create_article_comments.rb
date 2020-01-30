class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.text :content, null: false
      t.references :article, null: false, foreign_key: true
    end
  end
end
 