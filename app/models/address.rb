class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :city, :house_number, presence: true
  validates :tel, uniqueness: { case_sensitive: true }, allow_blank: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_furigana, :first_name_furigana, presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/, message: "は「-」を除いて記入してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  validates :area_id, presence: true

end
