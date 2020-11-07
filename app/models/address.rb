class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :last_name, :first_name, :last_name_furigana, :first_name_furigana, :postal_code, :city, :house_number, presence: true
  validates :tel, uniqueness: true, allow_blank: true
  validates :last_name, :first_name, format: {with:/\A[ぁ-んァ-ン一-龥]/, message: "は全角のみで入力して下さい"}
  validates :last_name_furigana, :first_name_furigana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナのみで入力して下さい"}
  validates :postal_code, format: {with: /\A\d{7}\z/, message: "は「-」を除いて記入してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  validates :area_id, presence: true

end
