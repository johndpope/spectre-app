require 'spec_helper'

describe "ActionPages" do

  subject { page }
  
  describe "activity page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:action) { FactoryGirl.create(:sign_in, user: user) }

    before do
      sign_in user
      visit activity_path
    end
    
    it { should have_selector('title', text: full_title('Activity')) }
    it { should have_content('Activity') }
    it { should have_content('signed in') }

  end

  describe "new comment" do

    let(:submit) { "Add Comment" }
    let!(:user) { FactoryGirl.create(:user) }
    let!(:case_file) { FactoryGirl.create(:layering, user: user) }

    describe "with blank comment box" do
    
      before do
        sign_in user
        visit case_file_path(CaseFile.first)
      end

      it "should not create an action" do
        expect { click_button submit }.not_to change(Action, :count)
      end
    end

    describe "with valid information" do

      before do
        sign_in user
        visit case_file_path(CaseFile.first)
        fill_in "content", with: "Verified."
      end

      it "should create an action" do
        expect { click_button submit }.to change(Action, :count).by(1)
      end
    end
  end
end
