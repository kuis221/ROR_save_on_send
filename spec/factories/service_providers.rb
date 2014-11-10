FactoryGirl.define do
  factory :service_provider do
    trait :western_union do
      name 'Western Union'
    end

    trait :xoom do
      name 'Xoom'
    end
  end
end
