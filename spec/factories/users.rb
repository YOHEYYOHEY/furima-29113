FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.initials}
    last_name             {Faker::Name.initials}
    first_name_kana       {Faker::Name.initials}
    last_name_kana        {Faker::Name.initials}
    birthday              {"2020/1/1"}
  end
end
