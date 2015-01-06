FactoryGirl.define do
  factory :service_provider do
    created_by { FactoryGirl.create(:admin, email: Faker::Internet.email) }

    trait :western_union do
      name 'Western Union'
    end

    trait :xoom do
      name 'Xoom'
    end

    trait :ria do
      name 'Ria'
    end
  end
end
