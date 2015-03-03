require 'rails_helper'

RSpec.describe "User creates a song" do
  describe "with valid attributes" do
    it "saves and displays the song title" do
      visit new_song_path
      fill_in "song[title]", with: "Never gonna give you up"
      fill_in "song[artist]", with: "Rick Astley"
      click_link_or_button "Create Song"
      expect(page).to have_content("Never gonna give you up")
    end
  end
end
