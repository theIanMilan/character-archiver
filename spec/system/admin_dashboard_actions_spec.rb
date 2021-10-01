require 'rails_helper'

RSpec.describe 'AdminDashboardActions', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin) { create(:user, :admin) }
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  it 'logs in as admin through login page' do
    visit root_path
    find('#header-sign-in').click

    find('#user_login').click.set(admin.email)
    find('#user_password').click.set(admin.password)
    within '#new_user' do
      click_on 'Sign in'
    end

    expect(page).to have_content('Site Administration')
  end

  it 'see all registered users in admin dashboard' do
    login_as(admin, scope: :user)
    visit rails_admin_path

    within 'table.table-striped' do
      click_link 'Users'
    end

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
  end

  it 'view specific user and show details' do
    login_as(admin, scope: :user)
    visit rails_admin_path

    visit "/admin/user/#{user1.id}"

    expect(page).to have_content(user1.email)
    expect(page).to have_content(user1.role)
  end
end
