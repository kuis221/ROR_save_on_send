require 'spec_helper'

describe User::RecentTransaction do
  let(:recent_transaction){FactoryGirl.create(:recent_transaction)}

  describe 'validation' do
    let(:recent_transaction){FactoryGirl.build(:recent_transaction)}
   
    %i{date currency amount_sent_cents amount_received_cents originating_source_of_funds service_provider
    destination_preference_for_funds fees_for_sending fees_for_receiving send_to_receive_duration
    documentation_requirements promotion service_quality comments}.each do |property|
      it "should be invalid if #{property} is not set" do
        recent_transaction.send("#{property}=", nil)
        expect(recent_transaction).to be_invalid
      end
    end
  end

  describe '#send_to_receive_duration=' do
    it 'should convert send_to_receive_duration to second base on send_to_receive_duration_interval' do
      recent_transaction.send_to_receive_duration_interval = 'minutes'
      recent_transaction.send_to_receive_duration = '10'

      expect(recent_transaction[:send_to_receive_duration]).to eq(600)
    end
  end

  describe '#send_to_receive_duration' do
    it 'should set send_to_receive_duration_interval base on value of send_to_receive_duration' do
      recent_transaction.send_to_receive_duration_interval = nil
      recent_transaction.send_to_receive_duration = 600

      expect(recent_transaction.send_to_receive_duration).to eq(10)
      expect(recent_transaction[:send_to_receive_duration]).to eq(600)
      expect(recent_transaction.send_to_receive_duration_interval).to eq('minutes')
    end
  end

  describe '#currency=' do
    it 'should set currency for amount sent' do
      recent_transaction = FactoryGirl.build(:recent_transaction, currency: 'INR', amount_sent: 100)

      expect(recent_transaction.amount_sent.currency.iso_code).to eq('USD')
      expect(recent_transaction.amount_sent.to_i).to eq(100)
    end

    it 'should set currency for amount received' do
      recent_transaction = FactoryGirl.build(:recent_transaction, currency: 'MXN', amount_received: 98)

      expect(recent_transaction.amount_received.currency.iso_code).to eq('MXN')
      expect(recent_transaction.amount_received.to_i).to eq(98)
    end
  end
end
