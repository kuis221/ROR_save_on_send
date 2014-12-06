require 'spec_helper'

describe Country do
  describe '#name' do
    let(:mexico){FactoryGirl.build(:mexico)}
    
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
end
