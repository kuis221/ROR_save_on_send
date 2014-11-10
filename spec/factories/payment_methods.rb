FactoryGirl.define do
  factory :payment_method do
    trait :cash do
      name 'cash'
      slug 'cash'
    end

    trait :bank do
      name 'bank account'
      slug 'bank'
    end
  end
end
