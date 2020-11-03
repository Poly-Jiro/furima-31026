FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja

    nickname                 {Faker::Games::Pokemon.name}
    email                    {Faker::Internet.free_email}
    password                 {Faker::Internet.password(min_length: 4).concat"1a"}
    password_confirmation    {password}
    family_name              {Faker::Name.last_name}
    family_name_kana         {Faker::Games::Pokemon.name.slice(0)}
    first_name               {Faker::Name.first_name}
    first_name_kana          {Faker::Games::Pokemon.name.slice(0)}
    birthday                 {Faker::Date.in_date_period}
  end
end