require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  # test "user can create a song" do
  #   visit new_song_path
  #   assert page.has_content?("Add your new song")
  #   fill_in "song[title]", with: "Never gonna give you up"
  #   fill_in "song[artist]", with: "Rick Astley"
  #   click_link_or_button "Create Song"
  #   assert page has_content?("Never gonna give you up")
  # end

  # test "user cannot create a song without a title" do
  #   visit new_song_path
  #   click_on "Create Song"
  # end

end
