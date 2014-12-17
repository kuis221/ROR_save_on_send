FactoryGirl.define do
  factory :feedback do
    user
    comments 'good service'
    service_quality 3
    approved true
  end
end
