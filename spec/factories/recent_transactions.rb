FactoryGirl.define do
  factory :recent_transaction, class: User::RecentTransaction do
    user {FactoryGirl.create(:user)}
    date '03/11/2014'
    currency 'INR'
    amount_sent '100'
    amount_received '55000'
    originating_source_of_funds_id {FactoryGirl.create(:payment_method, :cash).id}
    service_provider_id {FactoryGirl.create(:service_provider, :xoom).id}
    destination_preference_for_funds_id {FactoryGirl.create(:payment_method, :cash).id}
    fees_for_sending '$4'
    #fees_for_receiving '1%'
    send_to_receive_duration 86400
    documentation_requirements 'Photo ID'
    promotion 'n/a'
    feedback {Feedback.new(service_quality: 4, comments: 'n/a', user: user)}
  end
end
 
