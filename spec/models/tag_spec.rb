require 'rails_helper'
describe Tag do
  describe '#create' do
    it "nameが存在すること" do
      tag = Tag.new(name: "")
      tag.valid?
      expect(tag.errors[:name]).to include("を入力してください")
    end
    it "nameが一意であること" do
        #はじめにタグを登録
        tag = create(:tag)
        #先に登録したタグと同じの値を持つタグのインスタンスを作成
        another_tag = build(:tag)
        another_tag.valid?
      expect(another_tag.errors[:name]).to include("はすでに存在します")
    end
  end
end