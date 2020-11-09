class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, presence: true, uniqueness: { case_sensitive: true }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_furigana, :first_name_furigana, presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }


  has_many :cards
  has_many :products
  has_one :address 

end
