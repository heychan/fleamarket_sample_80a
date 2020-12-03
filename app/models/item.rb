class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # 外部キー設定しているカラムはアソシエーションで関係性が組まれているためバリデーションの記述はしなくても良い
  validates :item_images, :name, :description, :condition_id, :shipping_cost_id, :area_id, :day_id, presence: true
  validates :name, length: { maximum: 40 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 }
  belongs_to :category
  belongs_to :user

  has_one :purchase, dependent: :destroy

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end


end
