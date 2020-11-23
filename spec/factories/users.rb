FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"pas123"}
    password_confirmation {"pas123"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_furigana    {"ヤマダ"}
    first_name_furigana   {"タロウ"}
    birth_date            {"2000-08-03"}
  end
end