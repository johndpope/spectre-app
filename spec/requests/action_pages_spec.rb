require 'spec_helper'

describe "ActionPages" do

  subject { page }
  
  describe "activity page" do
    before { visit activity_path }
    
    it { should have_selector('title', text: full_title('Activity')) }
    it { should have_content('Activity') }
  end
end
