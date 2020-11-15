require 'rails_helper'
describe Address do
  describe '#create' do
    it "必須が存在すれば登録ができる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "last_nameが空では登録できないこと" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameが空では登録できないこと" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "last_name_furiganaが空では登録できないこと" do
      address = build(:address, last_name_furigana: nil)
      address.valid?
      expect(address.errors[:last_name_furigana]).to include("を入力してください")
    end

    it "first_name_furiganaが空では登録できないこと" do
      address = build(:address, first_name_furigana: nil)
      address.valid?
      expect(address.errors[:first_name_furigana]).to include("を入力してください")
    end

    it "postal_codeが空では登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "area_idが空では登録できないこと" do
      address = build(:address, area_id: nil)
      address.valid?
      expect(address.errors[:area_id]).to include("を入力してください")
    end

    it "cityが空では登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "house_numberが空では登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "重複したtelが存在する場合登録できないこと" do
      address = create(:address)
      address = build(:address, tel: address.tel)
      address.valid?
      expect(address.errors[:tel]).to include("はすでに存在します")
    end
  end

    describe '#文字数' do
      it "postal_codeが6文字以下であれば登録できないこと" do
        address = build(:address, postal_code: "123456")
        address.valid?
        expect(address.errors[:postal_code]).to include("は「-」を除いて記入してください")
      end

      it "postal_codeが8文字以上であれば登録できないこと" do
        address = build(:address, postal_code: "12345678")
        address.valid?
        expect(address.errors[:postal_code]).to include("は「-」を除いて記入してください")
      end
    end

      it '性を半角で入力した時登録できない' do
        address = build(:address, last_name: "ﾐｮｳｼﾞ")
        address.valid?
        expect(address.errors[:last_name]).to include("は全角で入力してください")
      end
   
      it '名を半角で入力した時登録できない' do
        address = build(:address, first_name: "ﾅﾏｴ")
        address.valid?
        expect(address.errors[:first_name]).to include("は全角で入力してください")
      end
  
    describe '#フリガナをカタカナ意外で入力' do
      it '性カナをカタカナ意外で入力した時登録できない' do
        address = build(:address, last_name_furigana: "kana")
        address.valid?
        expect(address.errors[:last_name_furigana]).to include("は全角カナで入力してください")
      end
   
      it '名カナをカタカナ意外で入力した時登録できない' do
        address = build(:address, first_name_furigana: "kana")
        address.valid?
        expect(address.errors[:first_name_furigana]).to include("は全角カナで入力してください")
      end
    end
end