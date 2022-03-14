FactoryBot.define do
	factory :comic do
			id { Faker::Number.number(digits: 10) }
			name { Faker::Name.name  }
			cover_img { Faker::Internet.url }
	end
end