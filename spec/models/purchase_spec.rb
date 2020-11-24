require 'rails_helper'

describe Purchase do
    it "ユーザIDが無い場合は登録できないこと" do
      purchase = build(:purchase, user_id: 1)
      purchase.valid?
      expect(purchase.errors[:user_id]).to include()
    end

    it "商品IDが無い場合は登録できないこと" do
      purchase = build(:purchase, item_id: 1)
      purchase.valid?
      expect(purchase.errors[:item_id]).to include()
    end
end
