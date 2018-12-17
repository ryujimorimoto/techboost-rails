class Topic < ApplicationRecord
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :comments
  has_many :favorite_users, through: :favorites, source: 'user'
end
