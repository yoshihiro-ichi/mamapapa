class Comment < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  validates :content, presence: true

end
