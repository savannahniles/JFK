require 'spec_helper'

describe "Post pages" do

  subject { page }

  describe "micropost creation" do
    before { visit root_path }

    describe "with valid information" do

      before { fill_in 'post_content', with: "Lorem ipsum" }
      it "should create a post" do
        expect { click_button "Submit" }.to change(Post, :count).by(1)
      end
    end
  end

  describe "index page" do
    #before { visit posts_path }

    #it { should have_content('All') }
    #it { should have_title(full_title('Posts')) }
  end

   describe "show post page" do
    #before { visit posts_path }

    #it { should have_content('All') }
    #it { should have_title(full_title('Posts')) }
  end

end