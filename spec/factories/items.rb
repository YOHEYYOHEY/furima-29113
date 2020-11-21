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

    user_id       { FactoryBot.create(:user).id }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
