FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja

    name                     { Faker::Games::Pokemon.name }
    description              { Faker::Games::Pokemon.move }
    price                    { Faker::Number.within(range: 300..9999999)}
    user                     { Faker::Number.within(range: 1..10)}
    status_id                { Faker::Number.within(range: 2..7)}
    fee_id                   { Faker::Number.within(range: 2..3)}
    source_id                { Faker::Number.within(range: 2..48)}
    schedule_id              { Faker::Number.within(range: 2..4)}
    category_id              { Faker::Number.within(range: 2..12)}
  end
end
