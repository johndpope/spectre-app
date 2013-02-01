require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

    it "should have the default title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                 text: "Double-Take")
    end

    it "should have the content 'Double-Take'" do
      visit '/static_pages/home'
      page.should have_content('Double-Take')
    end
  end

  describe "About Page" do

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                                 text: "Double-Take | About")
    end

    it "should have the content 'Coming Soon'" do
      visit '/static_pages/about'
      page.should have_content('Coming Soon')
    end
  end
end
