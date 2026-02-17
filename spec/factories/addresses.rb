FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state  }
    country { Faker::Address.country }
    zip { Faker::Address.zip }
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }

    factory :real_address do
      street { "350 fifth avenue" }
      city { "New York" }
      state { "NY" }
      zip { "10118" }
    end
  end
end
