class AddBrandNameToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :brand_name, :string
  end
end
