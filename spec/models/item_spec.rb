require 'rails_helper'
describe Item do
  describe '#create' do
    it "必須が存在すれば登録ができる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "imageが空では登録できないこと" do  
      item = build(:item ,:no_images)                                
      item.valid?
      expect(item.errors[:item_images]).to include("を入力してください")
    end

    it "nameが空では登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "categoryが空では登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "categoryが空では登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "descriptionが空では登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "condition_idが空では登録できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "shippin_cost_idが空では登録できないこと" do
      item = build(:item, shipping_cost_id: nil)
      item.valid?
      expect(item.errors[:shipping_cost_id]).to include("を入力してください")
    end

    it "area_idが空では登録できないこと" do
      item = build(:item, area_id: nil)
      item.valid?
      expect(item.errors[:area_id]).to include("を入力してください")
    end

    it "day_idが空では登録できないこと" do
      item = build(:item, day_id: nil)
      item.valid?
      expect(item.errors[:day_id]).to include("を入力してください")
    end
 

    it "priceが空では登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end
  end
  describe "#文字数" do
    it "nameが40文字でも登録できること" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "nameが41文字だと登録できないこと" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
  end

  describe "#金額" do
    it "priceが299以下だと登録できないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが300ちょうどだと登録できる" do
      item = build(:item, price: "300")
      expect(item).to be_valid
    end

    it "priceが9999999だと登録できる" do
      item = build(:item, price: "9999999")
 
      expect(item).to be_valid
    end

    it "priceが10000000だと登録できないこと" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end

