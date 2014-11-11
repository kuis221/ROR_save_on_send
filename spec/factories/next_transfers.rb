FactoryGirl.define do
  factory :next_transfer, class: User::NextTransfer do
    user {FactoryGirl.create(:user)}
    amount_send '100'
    amount_receive '55000'
    receive_currency 'INR'
    originating_source_of_funds {FactoryGirl.create(:payment_method, :cash)}
    destination_preference_for_funds {FactoryGirl.create(:payment_method, :cash)}
  end
end

