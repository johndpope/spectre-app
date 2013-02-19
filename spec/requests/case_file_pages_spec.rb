require 'spec_helper'

describe "CaseFilePages" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }
    let(:incident) { FactoryGirl.create(:layering) }
    let(:case_file) { incident.create_case_file(user_id: user.id, open: true) }

    before do
      sign_in user
      visit case_files_path
    end

    it { should have_selector('title', text: 'Open Cases') }
    it { should have_selector('h1', text: 'All Open Cases') }
    #it { should have_content('h1', text: 'Status: ') }
    #it { should have_content('h1', text: 'Open') }
  end
end
