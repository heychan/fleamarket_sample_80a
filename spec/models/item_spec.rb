require 'rails_helper'
describe Item do
  describe '#create' do
    it "必須が存在すれば登録ができる" do
      item = build(:item)
      expect(item).to be_valid
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

describe ItemImage do
  describe '#create' do
    it "imageが空だと登録できないこと" do
      item_image = build(:item_image, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("が入力されていません。")
    end
  end
end
# describe ItemImage do
#   describe '#create' do
#     # 1.imageが空だと登録できないこと
#     it "imageが空だと登録できないこと" do
#       item_image = build(:item_image, image: nil)
#       item_image.valid?
#       expect(item_image.errors[:image]).to include("が入力されていません。")
#   end
# end


#     # it "必須が存在すれば登録ができる" do
#     #   address = build(:address)
#     #   expect(address).to be_valid
#     # end

# #     it "last_nameが空では登録できないこと" do
# #       address = build(:address, last_name: nil)
# #       address.valid?
# #       expect(address.errors[:last_name]).to include("を入力してください")
# #     end

# #     it "first_nameが空では登録できないこと" do
# #       address = build(:address, first_name: nil)
# #       address.valid?
# #       expect(address.errors[:first_name]).to include("を入力してください")
# #     end

# #     it "last_name_furiganaが空では登録できないこと" do
# #       address = build(:address, last_name_furigana: nil)
# #       address.valid?
# #       expect(address.errors[:last_name_furigana]).to include("を入力してください")
# #     end

# #     it "first_name_furiganaが空では登録できないこと" do
# #       address = build(:address, first_name_furigana: nil)
# #       address.valid?
# #       expect(address.errors[:first_name_furigana]).to include("を入力してください")
# #     end

# #     it "postal_codeが空では登録できないこと" do
# #       address = build(:address, postal_code: nil)
# #       address.valid?
# #       expect(address.errors[:postal_code]).to include("を入力してください")
# #     end

# #     it "area_idが空では登録できないこと" do
# #       address = build(:address, area_id: nil)
# #       address.valid?
# #       expect(address.errors[:area_id]).to include("を入力してください")
# #     end

# #     it "cityが空では登録できないこと" do
# #       address = build(:address, city: nil)
# #       address.valid?
# #       expect(address.errors[:city]).to include("を入力してください")
# #     end

# #     it "house_numberが空では登録できないこと" do
# #       address = build(:address, house_number: nil)
# #       address.valid?
# #       expect(address.errors[:house_number]).to include("を入力してください")
# #     end

# #     it "重複したtelが存在する場合登録できないこと" do
# #       address = create(:address)
# #       address = build(:address, tel: address.tel)
# #       address.valid?
# #       expect(address.errors[:tel]).to include("はすでに存在します")
# #     end
# #   end

# #     describe '#文字数' do
# #       it "postal_codeが6文字以下であれば登録できないこと" do
# #         address = build(:address, postal_code: "123456")
# #         address.valid?
# #         expect(address.errors[:postal_code]).to include("は「-」を除いて記入してください")
# #       end

# #       it "postal_codeが8文字以上であれば登録できないこと" do
# #         address = build(:address, postal_code: "12345678")
# #         address.valid?
# #         expect(address.errors[:postal_code]).to include("は「-」を除いて記入してください")
# #       end
# #     end

# #       it '性を半角で入力した時登録できない' do
# #         address = build(:address, last_name: "ﾐｮｳｼﾞ")
# #         address.valid?
# #         expect(address.errors[:last_name]).to include("は全角で入力してください")
# #       end
   
# #       it '名を半角で入力した時登録できない' do
# #         address = build(:address, first_name: "ﾅﾏｴ")
# #         address.valid?
# #         expect(address.errors[:first_name]).to include("は全角で入力してください")
# #       end
  
# #     describe '#フリガナをカタカナ意外で入力' do
# #       it '性カナをカタカナ意外で入力した時登録できない' do
# #         address = build(:address, last_name_furigana: "kana")
# #         address.valid?
# #         expect(address.errors[:last_name_furigana]).to include("は全角カナで入力してください")
# #       end
   
# #       it '名カナをカタカナ意外で入力した時登録できない' do
# #         address = build(:address, first_name_furigana: "kana")
# #         address.valid?
# #         expect(address.errors[:first_name_furigana]).to include("は全角カナで入力してください")
# #       end
# #     end
# # end