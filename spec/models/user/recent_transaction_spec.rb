require 'spec_helper'

describe User::RecentTransaction do
  let(:recent_transaction){FactoryGirl.create(:recent_transaction)}

  describe 'validation' do
    let(:recent_transaction){FactoryGirl.build(:recent_transaction)}
   
    %i{date currency amount_sent_cents amount_received_cents originating_source_of_funds service_provider
    destination_preference_for_funds fees_for_sending_cents send_to_receive_duration
    feedback}.each do |property|
      it "should be invalid if #{property} is not set" do
        recent_transaction.send("#{property}=", nil)
        expect(recent_transaction).to be_invalid
      end
    end

    it 'should be invalid if service_quality and comments is not set for feedback' do
      recent_transaction.feedback.service_quality = nil
      recent_transaction.feedback.comments = ''

      expect(recent_transaction).to be_invalid
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

  describe '#total_cost' do
    it 'should calculate total cost for usd to usd transaction' do
      recent_transaction = FactoryGirl.build(:recent_transaction, currency: 'USD', amount_sent: 100, amount_received: 95, fees_for_sending: 5)

      expect(recent_transaction.total_cost).to eq(Money.new(1000, 'USD'))
    end

    it 'should calculate total cost for usd to destination currency transaction' do
      recent_transaction = FactoryGirl.build(:recent_transaction, currency: 'INR', amount_sent: 100, amount_received: 5650, fees_for_sending: 5)
    
      expect(recent_transaction.total_cost).to eq(Money.new(99511, 'INR'))
    end
  end

  describe '.duration_intervals_for_select' do
    after do
      I18n.locale = :en
    end

    it 'should return duration intervals in English' do
      I18n.locale = :en

      expect(User::RecentTransaction.duration_intervals_for_select).to eq(
        [['minutes', 'minutes'], ['hours', 'hours'], ['days', 'days']]
      )
    end

    it 'should return duration intervals in Spain' do
      I18n.locale = :es

      expect(User::RecentTransaction.duration_intervals_for_select).to eq(
        [['minutos', 'minutes'], ['horas', 'hours'], ['días', 'days']]
      )
    end
  end
end
