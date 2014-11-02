require 'rails_helper'

describe User do
  describe 'validation' do
    it 'should be invalid if email is not set' do
      expect(FactoryGirl.build(:user, email: '')).to be_invalid
    end

    it 'should be invalid if first name is not set' do
      expect(FactoryGirl.build(:user, first_name: '')).to be_invalid
    end

    it 'should be invalid if zipcode is not set' do
      expect(FactoryGirl.build(:user, zipcode: '')).to be_invalid
    end

    it 'should be invalid if money transfer destination is not set' do
      expect(FactoryGirl.build(:user, money_transfer_destination: nil)).to be_invalid
    end

    it 'should be invalid if money transfer destination is not in the list' do
      expect(FactoryGirl.build(:user, money_transfer_destination_id: Country.last.id + 1)).to be_invalid
    end
  end
end
