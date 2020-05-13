require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validation' do
    context '保存できる' do
      it 'ファクトリの値を使って保存できる' do
        article = build(:article)
        expect(article).to be_valid
      end
    end

    context '保存できない' do
      it '' do
      end
    end
  end
end
