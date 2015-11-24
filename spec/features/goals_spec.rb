require 'spec_helper'
require 'rails_helper'

describe "the goals process", :type => :feature do

  def sign_in(user)
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Sign In'
  end

  before(:each) do
    user_one = User.create(username: 'Billy', password: 'qwerty')
    user_two = User.create(username: 'Genevieve', password: 'qwerty')
  end

  #user_id
  #description
  #privacy_status
  #completion_status

  feature "Goals: user can" do
    before(:each) do
      goal1 = Goal.new(description: "Pass the test", privacy_status: "private", completion_status: "false")
      goal2 = Goal.new(description: "Finish the burrito", privacy_status: "public", completion_status: "true")
    end

    scenario "reach goal creation page" do
      visit goals_url
      click_on 'Create Goal'
      expect(page).to have_content "Create Goal"
    end

    def create_goal(goal)
      visit new_goal_url
      fill_in 'Description', with: goal1.description
      fill_in 'Status', with: goal1.privacy_status
      fill_in 'Complete?', with: goal1.completion_status
      click_on 'Create Goal'
    end

    scenario "create new goals for only themselves" do
      sign_in(user_one)
      create_goal(goal1)
      expect(page).to have_content "Pass the test"
    end

    scenario "edit own goals" do

    end

    scenario "not edit others' goals" do

    end


    scenario "delete only own goals" do

    end

    scenario "mark goals as 'Complete'" do

    end

    scenario "view all of own goals" do

    end

    scenario "can view all public goals" do

    end

    scenario "can't view others' private goals" do

    end

    scenario "can't create goals for others" do

    end
  end
end
