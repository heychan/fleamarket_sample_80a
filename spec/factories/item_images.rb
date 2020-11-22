FactoryBot.define do
  factory :item_image do
    # image { File.open("#{Rails.root}/public/uploads/item_image/image/1/9CnwZZ6j.jpg") }
    # image    { File.open("#{Rails.root}/spec/fixtures/9CnwZZ6j.jpg") }
    image    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}

    # association :item
  end
end