FactoryGirl.define do
  factory :payment_method do
    trait :cash do
      name 'cash'
    end
  end
end
