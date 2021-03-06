FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abcd1234' }
    password_confirmation { password }
    first_name            { '阿部' }
    last_name             { '太郎' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'タロウ' }
    birthday              { '2020/1/1' }
  end
end
