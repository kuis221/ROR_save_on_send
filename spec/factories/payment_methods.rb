FactoryGirl.define do
  factory :payment_method do
    trait :cash do
      name 'cash'
      name_es 'efectivo'
      slug 'cash'
    end

    trait :bank do
      name 'bank account'
      name_es 'cuenta bancaria'
      slug 'bank'
    end
  end
end
