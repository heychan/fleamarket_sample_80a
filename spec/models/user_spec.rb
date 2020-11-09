require 'rails_helper'
describe User do
  describe '#create' do
    it "ニックネームが空だと登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "性が空だと登録できない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "名が空だと登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "性カナが空だと登録できない" do
      user = build(:user, last_name_furigana: "")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("を入力してください")
    end

    it "名カナが空だと登録できない" do
      user = build(:user, first_name_furigana: "")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("を入力してください")
    end

    it "パスワードと確認パスワードが一致していないと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードが6文字以上で登録できる" do
      user = build(:user, password: "pas123", password_confirmation: "pas123")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが7文字未満だと登録できない" do
      user = build(:user, password: "pas")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  describe '#名前を半角で入力' do
    it '性を半角で入力した時登録できない' do
      user = build(:user, last_name: "ﾐｮｳｼﾞ")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角で入力してください")
    end
 
    it '名を半角で入力した時登録できない' do
      user = build(:user, first_name: "ﾅﾏｴ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力してください")
    end
  end

  describe '#フリガナをカタカナ意外で入力' do
    it '性カナをカタカナ意外で入力した時登録できない' do
      user = build(:user, last_name_furigana: "kana")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("は全角カナで入力してください")
    end
 
    it '名カナをカタカナ意外で入力した時登録できない' do
      user = build(:user, first_name_furigana: "kana")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("は全角カナで入力してください")
    end
  end
end