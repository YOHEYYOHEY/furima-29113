FactoryBot.define do
  factory :item do
    name                  { '名前' }
    introduction          { '説明' }
    category_id           { 1 }
    status_id             { 1 }
    delivery_charge_id    { 1 }
    delivery_area_id      { 1 }
    delivery_day_id       { 1 }
    price                 { 1000 }
    #created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    #updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    #user_id               { 1 }
    #item_id               { 1 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
