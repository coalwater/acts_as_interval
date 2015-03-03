FactoryGirl.define do
  factory :interval do
    starts_at { Faker::Date.backward(30) }
    ends_at { Faker::Date.forward(30) }

    trait :future do
      starts_at { Faker::Date.between(2.months.from_now, 4.months.from_now) }
      ends_at { Faker::Date.between(4.months.from_now, 6.months.from_now) }
    end

    trait :past do
      starts_at { Faker::Date.between(4.months.ago, 6.months.ago) }
      ends_at { Faker::Date.between(2.months.ago, 4.months.ago) }
    end

  end
end
