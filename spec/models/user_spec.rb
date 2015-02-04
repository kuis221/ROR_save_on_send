require 'rails_helper'

describe User do
  describe 'validation' do
    it 'should be invalid if email is not set' do
      expect(FactoryGirl.build(:user, email: '')).to be_invalid
    end

    it 'should be valid if email is set and phone is blank' do
      expect(FactoryGirl.build(:user, email: Faker::Internet.email, phone: '')).to be_valid
    end

    it 'should be valid if phone is set in the email field' do
      expect(FactoryGirl.build(:user, email: '222-200-3000')).to be_valid
    end

    context 'confirmed user' do
      let(:confirmed_user){FactoryGirl.create(:confirmed_user)}
      it 'should be invalid if first name is not set when user is already confirmed' do
        confirmed_user.update_attribute(:first_name, '')
        expect(confirmed_user).to be_invalid
      end

      it 'should be invalid if zipcode is not set when user is already confirmed' do
        confirmed_user.update_attribute(:zipcode, '')
        expect(confirmed_user).to be_invalid
      end

      it 'should be invalid if zipcode is not a 5 digit when user is already confirmed' do
        confirmed_user.update_attribute(:zipcode, 'aaaa')
        expect(confirmed_user).to be_invalid
      end

      it 'should be valid if zipcode is a 5 digit when user is already confirmed' do
        confirmed_user.update_attribute(:zipcode, '90536')
        expect(confirmed_user).to be_valid
      end

      context 'confirmation code' do
        let(:confirmed_user){FactoryGirl.create(:confirmed_user, email: '877-766-9622')}
        
        before do
          allow_any_instance_of(Twilio::REST::Messages).to receive(:create).and_return(true)
        end

        it 'should be invalid if confirmed code is not the same as confirmation token' do
          confirmed_user.update_attribute(:confirmation_code, (confirmed_user.confirmation_token.to_i + 1).to_s)
          expect(confirmed_user).to be_invalid
        end

        it 'should be invalid if confirmed code is not the same as confirmation token' do
          confirmed_user.update_attribute(:confirmation_code, confirmed_user.confirmation_token)
          expect(confirmed_user).to be_valid
        end
      end
    end

    it 'should be invalid if money transfer destination is not set' do
      expect(FactoryGirl.build(:user, money_transfer_destination: nil)).to be_invalid
    end

    it 'should be invalid if money transfer destination is not in the list' do
      expect(FactoryGirl.build(:user, money_transfer_destination_id: Country.last.id + 1)).to be_invalid
    end
  end

  describe '#prefered_currency' do
    let(:user){FactoryGirl.create(:user, money_transfer_destination: FactoryGirl.create(:china))}
    
    it 'should return USD as first currency' do
      expect(user.prefered_currency.first).to eq('USD')
    end

    it 'should return CNY as second transaction' do
      expect(user.prefered_currency.last).to eq('CNY')
    end

    it 'should return only INR for user who specify India as money distination' do
      user = FactoryGirl.create(:user, money_transfer_destination: FactoryGirl.create(:india))
      expect(user.prefered_currency).to eq(['INR'])
    end

    it 'should return only MXN for user who specify Mexico as money distination' do
      user = FactoryGirl.create(:user, money_transfer_destination: FactoryGirl.create(:mexico))
      expect(user.prefered_currency).to eq(['MXN'])
    end
  end

  describe '#full_name' do
    it 'should return full name for user which specified first and last name' do
      user = FactoryGirl.build(:user, first_name: 'Foo', last_name: 'Bar')
    
      expect(user.full_name).to eq('Foo Bar')
    end

    it 'should return full name for user which specified only first name' do
      user = FactoryGirl.build(:user, first_name: 'Foo', last_name: nil)
      
      expect(user.full_name).to eq('Foo')
    end
  end

  describe '#phone_with_international_code' do
    it 'should return user phone number with international code' do
      user = FactoryGirl.build(:user, phone: '610-555-7069')
      expect(user.phone_with_international_code).to eq('+16105557069')
    end

    it 'should return user phone number with international code' do
      user = FactoryGirl.build(:user, phone: '(610) 555-7069')
      expect(user.phone_with_international_code).to eq('+16105557069')
    end
  end
end
