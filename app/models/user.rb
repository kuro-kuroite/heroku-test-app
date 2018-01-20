class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog, dependent: :destroy
  validates :name, presence: true,
                   length: { maximum: 30 }

  VALID_EMAIL_ADDRESS = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_ADDRESS },
                    uniqueness: true
  before_save { email.downcase! }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true
end
