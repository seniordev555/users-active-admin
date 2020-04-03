class Book < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
