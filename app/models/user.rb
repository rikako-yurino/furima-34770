class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do  
    validates :email
    validates :birthday
    validates :nickname
    validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers"}
    
    with_options format:{with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"} do  
      validates :last_name
      validates :first_name
    end

    with_options format:{with: /\A[ァ-ヶー－]+\z/, message: " Full-width katakana characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
