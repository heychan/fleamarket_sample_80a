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
   
    trait :no_images do
      after(:build) {|item| item.item_images = []}
    end
    # trait :add_image do
    after(:build) do |item|
      item.item_images << build(:item_image)
    # end
    end
  end
end