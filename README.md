## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null: false, unique:true|
|password|string|null: false|

### Association
- belongs_to :identity
- has_many :products
- has_many :addresses

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
- has_many :images
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- belongs_to :shipping_cost
- belongs_to :area
- belongs_to :day

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- has_many :products

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association
- has_many :products

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :products

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## shipping_costsテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :products

## daysテーブル

|Column|Type|Options|
|------|----|-------|
|day|string|null: false|

### Association
- has_many :products

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|area|string|null: false|

### Association
- has_many :products
- has_many :addresses

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
- belongs_to :user
- belongs_to :area