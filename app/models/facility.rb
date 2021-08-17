class Facility < ApplicationRecord
 belongs_to :user
 has_many :favorites, dependent: :destroy
 has_many :favorite_users, through: :favorites, source: :user
 has_many :comments, dependent: :destroy
 mount_uploader :image, ImageUploader
 validates :title, presence: true, length:{ maximum: 20 }
 validates :content, presence: true,length:{ maximum: 250 }
 validates :prefecture, presence: true,length:{ maximum: 10 }
end
