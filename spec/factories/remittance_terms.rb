FactoryGirl.define do
  factory :remittance_term do
    trait :western_union_mexico do
      receive_country {FactoryGirl.create(:mexico)}
      service_provider {FactoryGirl.create(:service_provider, :western_union)}
      send_method {FactoryGirl.create(:payment_method, :bank)}
      receive_method {FactoryGirl.create(:payment_method, :cash)}
      receive_currency 'MXN'
      send_amount_range_from    0
      send_amount_range_to      200
      fees_for_sending_cents    400
      fees_for_sending_percent  0
      fx_markup                 2.43
      duration                  120
      documentation             ''
      promotions                ''
      service_quality           ''
    end

    trait :ria_china do
      receive_country {FactoryGirl.create(:china)}
      service_provider {FactoryGirl.create(:service_provider, :ria)}
      send_method {FactoryGirl.create(:payment_method, :bank)}
      receive_method {FactoryGirl.create(:payment_method, :bank)}
      receive_currency 'USD'
      send_amount_range_from    0
      send_amount_range_to      200
      fees_for_sending_cents    300
      fees_for_sending_percent  0
      fx_markup                 0
      duration                  120
      documentation             ''
      promotions                ''
      service_quality           ''
    end
  end
end
