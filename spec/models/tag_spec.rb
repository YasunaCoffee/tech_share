require 'rails_helper'
describe Tag do
  describe '#create' do
    context '保存できない' do
      it "nameが存在しなければ保存できない" do
        tag = Tag.new(name: "")
        tag.valid?
        expect(tag.errors[:name]).to include("を入力してください")
      end
      it "既に存在するnameでは保存できない" do
        #はじめにタグを登録
        tag = create(:tag)
        #先に登録したタグと同じの値を持つタグのインスタンスを作成
        another_tag = build(:tag, name: tag.name)
        another_tag.valid?
        expect(another_tag.errors[:name]).to include("はすでに存在します")
      end
    end

  end
end
