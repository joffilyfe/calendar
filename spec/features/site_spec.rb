require 'rails_helper'
require 'capybara/rspec'
include Warden::Test::Helpers

describe 'homepage view' do
  it 'should have menu bar' do
    visit '/'
    expect(page).to have_content 'Calendar'
  end
end


describe 'the signin process', :type => :feature do
  before :each do
    User.create(:email => 'admin@example.com', :password => 'password', admin: true)
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it 'signs me in as simple user' do
    visit new_user_session_url
    within('#new_user') do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'signs me in as admin' do
    visit new_user_session_url
    within('#new_user') do
      fill_in 'Email', :with => 'admin@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

end

describe 'access restricted content' do
  context 'accessing as admin' do
    before(:each) do
      @admin = FactoryGirl.create(:user, :admin)
      login_as(@admin, :scope => :user)
    end

    it 'should get a task list' do
      visit '/core/tasks'
      expect(page).to have_content 'Listing Tasks'
    end

    it 'should get create view' do
      visit new_core_task_url
      expect(page).to have_content 'New Task'
    end

    it 'should get create view' do
      visit new_core_task_url
      expect(page).to have_content 'New Task'
    end

    it 'should create new task' do
      visit new_core_task_url
      within('#new_task') do
        fill_in 'Title', :with => 'My new task'
        fill_in 'Description', :with => 'Some description here'
      end
      click_button 'Create Task'
      expect(page).to have_content 'Task was successfully created.'
      expect(page).to have_content 'My new task'
    end

  end
end
