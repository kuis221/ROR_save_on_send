require 'spec_helper'

describe Country do
  let(:mexico){FactoryGirl.build(:mexico)}
  let(:china){FactoryGirl.build(:china)}

  describe '#name' do 
    after do
      I18n.locale = :en
    end

    it 'should return name of the country in English' do
      I18n.locale = :en

      expect(mexico.name).to eq('Mexico')
    end

    it 'should return name of the country in English' do
      I18n.locale = :es

      expect(mexico.name).to eq('Mexico')
    end
  end

  describe 'receive_currency' do
    it 'should return only MXN for mexico' do
      expect(mexico.receive_currency).to eq(['MXN'])
    end

    it 'should return USD and CNY for china' do
      expect(china.receive_currency).to eq(['USD', 'CNY'])
    end
  end
end
