FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { 'done' }
    due_date { Faker::Date.forward(days: 30) }
    association :user, factory: :user
  end
end
