class Blog < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    validates :title,
        presence: true,
        length: {in: 1..30, allow_blank: true}
    validates :content,
        presence: true,
        length: {in: 1..140, allow_blank: true}

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
