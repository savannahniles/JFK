require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
  end

  describe "Home page" do
  	before { visit root_path }
  end
end