FactoryBot.define do
  factory :item do
    name             {"ネックレス"}
    price            {"10000"}
    description      {"aaa"}
    condition_id     {1}
    # category_id      {1}
    shipping_cost_id {1}
    day_id           {1}
    area_id          {1}
    brand_name       {"シャネル"}
    # user_id          {1}


# associationの記述
    association :category
    association :user
   
    after(:build) do |item|
      item.item_images << build(:item_image)

    #   parent_category = create(:category)
    #   child_category = parent_category.children.create(name: "child")      
    #   grand_child_category = child_category.children.create(name: "grandchild")

    #   item.category_id = grand_child_category.id

    end
  end
end