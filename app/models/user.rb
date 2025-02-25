class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, } do
      validates :last_name, presence: true
      validates :first_name, presence: true
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/} do 
      validates :last_name_kana, presence: true
      validates :first_name_kana, presence: true
    end
    validates :birth_date, presence: true
    PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください'
  end
end
