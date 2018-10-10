class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  include Sluggi::Slugged

  def slug_value
    name
  end

  def slug_value_changed?
    name_changed?
  end
end
