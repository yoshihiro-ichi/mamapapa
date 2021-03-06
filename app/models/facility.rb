class Facility < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length:{ maximum: 20 }
  validates :content, presence: true,length:{ maximum: 300 }
  validates :prefecture, presence: true
  presence_values = ['北海道',
                    '青森県','岩手県','宮城県','秋田県','山形県','福島県',
                    '茨城県','栃木県','埼玉県','千葉県','東京都','神奈川県',
                    '新潟県','富山県','石川県','福井県','山梨県','長野県',
                    '岐阜県','静岡県','愛知県','三重県',
                    '滋賀県','京都県','大阪府','兵庫県','奈良県','和歌山県',
                    '鳥取県','島根県','岡山県','広島県','山口県','徳島県','香川県','愛媛県','高知県',
                    '福岡県','佐賀県','長崎県','熊本県','大分県','宮崎県','鹿児島県','沖縄県']
  validates :prefecture, inclusion: { in: presence_values, message: "%{value}欄にない値、空欄は無効です" }
  geocoded_by :address
  geocoded_by :title
  after_validation :geocode, if: :address_changed?,if: :title_changed?
end
