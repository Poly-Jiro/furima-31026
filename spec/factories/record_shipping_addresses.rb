FactoryBot.define do
  factory :record_shipping_address do
    Faker::Config.locale = :ja
    postal_code                { Faker::Address.postcode}
    prefecture                 { Faker::Number.within(range: 2..48) }
    municipality               { Faker::Address.city }
    street_number              { Faker::Address.street_address  }
    building_name              { Faker::Address.street_address }
    telephone_number            { Faker::Number.number(digits: 11)}

  end
end
