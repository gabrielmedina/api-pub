class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

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
