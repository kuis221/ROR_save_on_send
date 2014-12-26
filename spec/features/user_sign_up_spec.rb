require 'spec_helper'

feature 'Sign up' do
  scenario 'visitor can sign up when provide all the information' do
    visit new_user_registration_url

    fill_in 'user_email', with: Faker::Internet.email
    #fill_in 'Password', with: 'password123'
    #fill_in 'Password confirmation', with: 'password123'
    #fill_in 'First name', with: Faker::Name.first_name
    #fill_in 'Last name', with: Faker::Name.last_name
    #fill_in 'Zipcode', with: Faker::Address.zip_code
    
    #choose "user_money_transfer_destination_id_#{Country.find_by(name: 'India').id}"
      
    click_button 'Create my account!'

    expect(page).to have_content('Verification email was sent to your email address - please click link in that email to confirm')
  end
end
