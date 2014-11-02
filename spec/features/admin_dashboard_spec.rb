require 'spec_helper'

feature 'Admin dashboard' do
  let(:user){FactoryGirl.create(:user, password: 'password123')}
  let!(:admin){FactoryGirl.create(:admin)}

  scenario 'visit admin dashboard as admin' do
    visit rails_admin_url

    fill_in 'Email', with: 'admin@saveonsend.com'
    fill_in 'Password', with: 'admin_password'

    click_on 'Log in'

    expect(page).to have_content('Site Administration')
  end

  scenario 'visit admin dashboard as a user' do
    visit rails_admin_url

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'

    click_on 'Log in'

    expect(page).to have_content('Invalid email or password')
  end
end
