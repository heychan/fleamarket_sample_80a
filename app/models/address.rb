class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :user, optional: true
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  POST_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\z|\A\d{3}\z|\A\d{5}\z|\A\d{7}\z/
  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  validates :first_name, :last_name, :first_name_furigana, :last_name_furigana, :postal_code, :area_id, :city, :house_number, presence: true
  validates :last_name, :first_name, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  validates :last_name_furigana, :first_name_furigana, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }
  validates :postal_code, format: {with: POST_NUMBER_REGEX}
  validates :postal_code, length: { is: 7 }
  validates :tel, format: { with: PHONE_NUMBER_REGEX }, allow_blank: true

end
