require 'rails_helper'
require 'capybara/rspec'
include Warden::Test::Helpers

describe 'access restricted content' do
  context 'accessing as admin' do
    before(:each) do
      @admin = FactoryGirl.create(:user, :admin)
      login_as(@admin, :scope => :user)
    end

    it 'should get a task list' do
      visit core_tasks_url
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

  context 'accessing as user' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
    end

    it 'should get a task list' do
      visit core_tasks_url
      expect(page).to have_content 'Listing Tasks'
    end

    it 'creat task view should get restricted notice' do
      visit new_core_task_url
      expect(page).to have_content "You don't have permission to access this resource."
    end
  end
end
