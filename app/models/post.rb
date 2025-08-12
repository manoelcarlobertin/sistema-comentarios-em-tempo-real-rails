class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_rich_text :body
  has_one_attached :banner_image

  validates :title, presence: true
  validates :body, presence: true
end
