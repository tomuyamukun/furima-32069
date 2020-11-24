class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: { with: /\A[あ-ん一-龥]+\z/, message: "Full-width characters"}
    validates :last_name_kanji, format: { with: /\A[あ-ん一-龥]+\z/, message: "Full-width characters"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana character"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana character"}
    validates :birthday
  end
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX, message: "Include both letters and numbers"}
end
