class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一一]+\z/} do
    validates :first_name_katakana
    validates :last_name_katakana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角数字と半角英字の両方を含めて設定してください'
end
