FactoryBot.define do
	factory :character do
		id { Faker::Number.number(digits: 10) }
		name { Faker::Name.name  }
	end
end