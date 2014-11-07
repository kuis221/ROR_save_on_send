FactoryGirl.define do
  factory :recent_transaction, class: User::RecentTransaction do
    user {FactoryGirl.create(:user)}
    date '11/03/2014'
    currency 'INR'
    amount_sent '100'
    amount_received '55000'
    originating_source_of_funds {FactoryGirl.create(:payment_method, :cash)}
    service_provider {FactoryGirl.create(:service_provider, :xoom)}
    destination_preference_for_funds {FactoryGirl.create(:payment_method, :cash)}
    fees_for_sending '$4'
    #fees_for_receiving '1%'
    send_to_receive_duration 86400
    documentation_requirements 'Photo ID'
    promotion 'n/a'
    service_quality 4
    comments 'n/a'
  end
end
 
