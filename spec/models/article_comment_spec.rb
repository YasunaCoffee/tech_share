require 'rails_helper'

RSpec.describe ArticleComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validation' do
    context '保存することができる' do
      it 'factoryの値を使って保存' do
        article_comment = build(:article_comment)
        create_list(:tag, 5)
        anothor_article = build(:article)
        expect(article_comment).to be_valid
      end
    end
    context '保存することができない' do
      it ' ' do
      end
    end
  end

end
