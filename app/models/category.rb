class Category < ApplicationRecord
  include Sluggi::Slugged
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :name, :description, presence: true

  has_many :products, dependent: :destroy

  def slug_value
    name
  end

  def slug_value_changed?
    name_changed?
  end
end
