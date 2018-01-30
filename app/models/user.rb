class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog, dependent: :destroy
  validates :name,
      presence: true,
      length: { maximum: 30, allow_blank: true }

  VALID_EMAIL_ADDRESS = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
      presence: true,
      length: { maximum: 255, allow_blank: true },
      format: { with: VALID_EMAIL_ADDRESS, allow_blank: true },
      uniqueness: true
  before_save { email.downcase! }

  has_secure_password
  validates :password,
      presence: true,
      length: { minimum: 6, allow_blank: true },
      allow_nil: true

  mount_uploader :image, ImageUploader
  # validates :image, check_image: true
  #
  # def check_image
  #   if !['.jpg', 'png', '.gif'].include?(File.extname(name).downcase)
  #     errors.add(:image, 'JPG, PNG, GIF以外の画像はアップロードできません')
  #   elsif file.size > 1.megabyte
  #     errors.add(:image, '1MBより大きい画像はアップロードできません')
  #   end
  # end
end
