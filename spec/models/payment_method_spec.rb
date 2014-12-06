require 'spec_helper'

describe PaymentMethod do
  describe '#name' do
    let(:cash){FactoryGirl.build(:payment_method, :cash)}

    after do
      I18n.locale = :en
    end

    it 'should return name of payment method in English' do
      I18n.locale = :en

      expect(cash.name).to eq('cash')  
    end

    it 'should return name of payment method on English' do
      I18n.locale = :es
      
      expect(cash.name).to eq('cash')
    end
  end

  describe '.for_receiving' do
    it 'should return all the payment method without plastic card' do
      card = FactoryGirl.create(:payment_method, :card)
      FactoryGirl.create(:payment_method, :cash)
      FactoryGirl.create(:payment_method, :bank)

      expect(PaymentMethod.for_receiving.all).to_not be_include(card)
    end
  end
end
