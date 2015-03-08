require 'spec_helper'

describe FXRate do
  describe '.convert' do
    it 'should convert 100 USD to INR using fx rate for 23 september 2014' do
      amount_in_inr = FXRate.convert(amount: Money.new(100), to_currency: 'INR', date: Date.parse('23/09/2014'))
    
      expect(amount_in_inr).to eq(Money.new(6098, 'inr'))
    end
  end
end
