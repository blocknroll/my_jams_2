require 'test_helper'

class UserIntegrationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "registered user can login" do
    user = User.create(user_name: 'd', password: 'g')
    visit login_path
    fill_in "session[user_name]", with: 'd'
    fill_in "session[password]", with: 'g'
    click_link_or_button "Sign In, brah"
    assert page.has_content?('All Your Songs')
  end

  test "user must submit info" do
    user = User.create(user_name: 'd', password: 'g')
    visit login_path
    click_link_or_button "Sign In, brah"
    within("#errors") do
      assert page.has_content?("Invalid login, brah")
    end
  end

  test "authenticated user can logout" do
    user = User.create(user_name: 'd', password: 'g')
    post '/login', {session: {user_name: 'd', password: 'g'}}
    visit songs_path(user)
    click_link_or_button "Logout, brah"
    within('#bye') do
      assert page.has_content?("Later, brah")
    end
  end


  test "registered user should only see their own songs" do

  end


end



# As an exisiting user When I visit '/songs' Then I should see only songs associated with my account
#
# As an existing user When I visit my profile Then I should see my profile
#
# As a non-exisiting user When I visit a users profile Then I should be redirected to the home page And I should see a flash alert saying "Not authorized."
#
# As an admin user When I visit a users profile Then I should see the profile information for that user ```
