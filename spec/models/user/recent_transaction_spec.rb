require 'spec_helper'

describe User::RecentTransaction do
  let(:recent_transaction){User::RecentTransaction.new}

  describe '#send_to_receive_duration=' do
    it 'should convert send_to_receive_duration to second base on send_to_receive_duration_interval' do
      recent_transaction.send_to_receive_duration_interval = 'minutes'
      recent_transaction.send_to_receive_duration = '10'

      expect(recent_transaction[:send_to_receive_duration]).to eq(600)
    end
  end

  describe '#send_to_receive_duration' do
    it 'should set send_to_receive_duration_interval base on value of send_to_receive_duration' do
      recent_transaction.send_to_receive_duration = 600

      expect(recent_transaction.send_to_receive_duration).to eq(10)
      expect(recent_transaction[:send_to_receive_duration]).to eq(600)
      expect(recent_transaction.send_to_receive_duration_interval).to eq('minutes')
    end
  end
end
