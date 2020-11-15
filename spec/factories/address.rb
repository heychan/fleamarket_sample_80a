FactoryBot.define do

  factory :address do
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_furigana    {"ヤマダ"}
    first_name_furigana   {"タロウ"}
    postal_code           {"1234567"}
    area_id               {"id: 1, name: '北海道'"}
    city                  {"札幌"}
    house_number          {"1-1-1"}
    room_number           {"山田ビル101"}
    tel                   {"09012345678"}

    association :user
  end

end