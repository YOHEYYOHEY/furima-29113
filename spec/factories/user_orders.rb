FactoryBot.define do
  factory :user_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { 1234567 }
    prefecture_id { 1 }
    city {'横浜市緑区'}
    house_number {'青山1-1-1'}
    phone_number { 12345678910 }
  end
end
