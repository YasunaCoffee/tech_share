require 'rails_helper'
describe Tag do
  describe '#create' do
    it "nameが存在すること" do
      tag = Tag.new(name: "")
      tag.valid?
      expect(tag.errors[:name]).to include("を入力してください")
    end
  end
end