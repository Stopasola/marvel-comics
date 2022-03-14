FactoryBot.define do
    factory :upvote do
      id { Faker::Number.number(digits: 10) }
      user_id { Faker::Number.number(digits: 10) }
      comic_id { Faker::Alphanumeric.alpha(number: 10) }
    end
  end