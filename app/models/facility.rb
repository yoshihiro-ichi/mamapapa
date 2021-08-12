class Facility < ApplicationRecord
 belongs_to :user
 mount_uploader :image, ImageUploader
 validates :title, presence: true
 validates :content, presence: true
 validates :types, presence: true
 validates :prefecture, presence: true
 validates :address, presence: true
end
