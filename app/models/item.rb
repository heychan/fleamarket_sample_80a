class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, :name, :description, :price, :category_id, :condition_id, :shipping_cost_id, :area_id, :day_id, presence: true

  belongs_to :category

  has_one :purchase
end
