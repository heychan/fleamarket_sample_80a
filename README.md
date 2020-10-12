## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null: false, unique:true|
|password|string|null: false|

### Association
- has_one :identity dependent: :destroy
- has_many :products dependent: :destroy
- has_many :purchases dependent: :destroy

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|shipping_cost_id|integer|null: false, foreign_key: true|
|area_id|integer|null: false, foreign_key: true|
|day_id|integer|null: false, foreign_key: true|
|price|integer|null: false|

### Association
- has_many :product_images dependent: :destroy
- belongs_to_active_hash :user
- belongs_to_active_hash :category
- belongs_to_active_hash :brand
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :area
- belongs_to_active_hash :day
- has_one :purchase dependent: :destroy

## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :products dependent: :destroy

## identitiesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|furigana|string|null: false|
|birth_day|date|null: false|

### Association
- belongs_to :user

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|furigana|string|null: false|
|postal_code|string|null: false|
|area_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|room_number|string||
|tel|string||

### Association
- belongs_to :purchase
- belongs_to_active_hash :area

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- has_one :address dependent: :destroy