require 'spec_helper'

describe User::NextTransfer do
  describe 'validation' do
    let(:next_transfer){FactoryGirl.build(:next_transfer)}

    it 'should be invalid if amount send and amount receive is not set' do
      next_transfer.amount_send = 0
      next_transfer.amount_receive = 0

      expect(next_transfer).to be_invalid
    end

    it 'should be invalid if receive currency is not set' do
      next_transfer.receive_currency = nil

      expect(next_transfer).to be_invalid
    end

    it 'should be invalid if originating source of funds is not set' do
      next_transfer.originating_source_of_funds = nil

      expect(next_transfer).to be_invalid
    end

    it 'should be invalid if destination preference for funds is not set' do
      next_transfer.destination_preference_for_funds = nil

      expect(next_transfer).to be_invalid
    end

    it 'should be invalid if user is not nest and money transfer destination is not set' do
      next_transfer.user = nil

      expect(next_transfer).to be_invalid
    end

    it 'should be valid if only amount send is specified' do
      next_transfer.amount_receive = 0

      expect(next_transfer).to be_valid
    end
  end
end
