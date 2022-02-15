FactoryBot.define do
  factory :enterprise do
    name { Faker::Name.unique.name }
  end
end 