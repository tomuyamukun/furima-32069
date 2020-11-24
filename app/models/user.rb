class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name_kanji, presence: true, format: { with: /\A[あ-ん一-龥]+\z/ }
  validates :last_name_kanji, presence: true, format: { with: /\A[あ-ん一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGIX }

end
