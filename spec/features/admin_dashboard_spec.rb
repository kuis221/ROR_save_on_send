require 'spec_helper'

feature 'Admin dashboard' do
  let(:user){FactoryGirl.create(:user, password: 'password123')}
  let!(:admin){FactoryGirl.create(:admin)}

  scenario 'visit admin dashboard as admin' do
    visit rails_admin_url

    within '#new_admin' do
      fill_in 'Email', with: 'admin@saveonsend.com'
      fill_in 'Password', with: 'admin_password'

      click_on 'Log in'
    end

    expect(page).to have_content('Site Administration')
  end

  scenario 'visit admin dashboard as a user' do
    visit rails_admin_url

    within '#new_admin' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password123'

      click_on 'Log in'
    end

    expect(page).to_not have_content('Site Administration')
  end
end
