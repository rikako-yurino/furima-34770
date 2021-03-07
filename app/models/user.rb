class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do  
    validates :email, uniqueness: true
    validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "Include both letters and numbers"}
    validates :nickname
    validates :last_name, format:{with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"}
    validates :first_name, format:{with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"}
    validates :last_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: " Full-width katakana characters"}
    validates :first_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: " Full-width katakana characters"}
    validates :birthday
  end
end
