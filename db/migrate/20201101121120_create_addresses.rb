class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.string :last_name,               null: false
      t.string :first_name,               null: false
      t.string :last_name_furigana,               null: false
      t.string :first_name_furigana,               null: false
      t.string :postal_code,               null: false
      t.integer :area_id,                 null: false
      t.string :city,               null: false
      t.string :house_number,               null: false
      t.string :room_number
      t.string :tel
      t.timestamps
    end
  end
end
