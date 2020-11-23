class AddBrandNameToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :brand_name, :string
    add_reference :items, :user, foreign_key: true, null: false
  end
end
