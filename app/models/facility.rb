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
  validates :prefecture, inclusion: { in: presence_values  }






  # enum prefecture:{
  #    " ":0,
  #    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
  #    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
  #    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
  #    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
  #    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
  #    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
  #    徳島県:36,香川県:37,愛媛県:38,高知県:39,
  #    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
  #    沖縄県:47
  #   }
end
