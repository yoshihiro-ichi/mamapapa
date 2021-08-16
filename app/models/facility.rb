class Facility < ApplicationRecord
 belongs_to :user
 has_many :favorites, dependent: :destroy
 has_many :favorite_users, through: :favorites, source: :user
 mount_uploader :image, ImageUploader
 validates :title, presence: true, length:{ maximum: 20 }
 validates :content, presence: true,length:{ maximum: 250 }
 validates :prefecture, presence: true,length:{ maximum: 10 }
 validates :address, presence: true
end
