class Item < ApplicationRecord
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, presence: true

  belongs_to :category
  has_one :purchase
end
