class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # 外部キー設定しているカラムはアソシエーションで関係性が組まれているためバリデーションの記述はしなくても良い
  validates :item_images, :name, :description, :condition_id, :shipping_cost_id, :area_id, :day_id, :price, presence: true

  belongs_to :category

  has_one :purchase
end
