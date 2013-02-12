require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Spectre') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
    it { should have_content('Market Surveillance System') }
  end

  describe "activity page" do
    before { visit activity_path }
    
    it { should have_selector('title', text: full_title('Activity')) }
    it { should have_content('Activity') }
  end

  describe "About Page" do
    before { visit about_path }

    it { should have_selector('title', text: full_title('About')) }
    it { should have_content('About Spectre') }
  end

  describe "Support Page" do
    before { visit support_path }

    it { should have_selector('title', text: full_title('Support')) }
    it { should have_content('Support') }
  end


  describe "Contact Page" do
    before { visit contact_path }

    it { should have_selector('title', text: full_title('Contact')) }
    it { should have_content('Contact Us') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector('title', text: full_title('About'))
    click_link "Support"
    page.should have_selector('title', text: full_title('Support'))
    click_link "Contact"
    page.should have_selector('title', text: full_title('Contact'))
  end
end
