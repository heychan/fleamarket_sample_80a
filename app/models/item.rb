class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, presence: true

  belongs_to :category
  has_one :purchase
end
