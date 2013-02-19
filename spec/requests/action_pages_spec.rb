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
end
