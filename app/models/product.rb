class Product < ApplicationRecord
  include Sluggi::Slugged
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, :price, :quantity, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :category

  def slug_value
    name
  end

  def slug_value_changed?
    name_changed?
  end
end
