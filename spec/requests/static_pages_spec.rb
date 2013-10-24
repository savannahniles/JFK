require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do

    it "should have the content 'About'" do
      #before { visit about_path }
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end
end