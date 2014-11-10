FactoryGirl.define do
  factory :india, class: Country do
    name 'India'
    currency_code 'INR'
  end

  factory :mexico, class: Country do
    name 'Mexico'
    currency_code 'MXN'
  end
end
 
