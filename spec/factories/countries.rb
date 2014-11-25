FactoryGirl.define do
  factory :india, class: Country do
    name 'India'
    name_es 'India'
    currency_code 'INR'
  end

  factory :mexico, class: Country do
    name 'Mexico'
    name_es 'México'
    currency_code 'MXN'
  end

  factory :china, class: Country do
    name 'China'
    name_es 'China'
    currency_code 'CNY'
  end
end
 
