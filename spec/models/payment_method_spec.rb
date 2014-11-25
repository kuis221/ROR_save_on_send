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

    it 'should return name of payment method on Spanish' do
      I18n.locale = :es
      
      expect(cash.name).to eq('efectivo')
    end
  end
end
