require 'spec_helper'

describe "CaseFilePages" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:case_file) { FactoryGirl.create(:layering, user: user) }

    before do
      sign_in user
      visit case_files_path
    end

    it { should have_selector('title', text: 'Open Cases') }
    it { should have_selector('h1', text: 'All Open Cases') }
    
    it { should have_selector('td', text: 'Case Id:') }
    it { should have_selector('td', text: 'Incident Type: Layering') }
    it { should have_selector('td', text: 'Incident Participants: Acme') }
    it { should have_selector('td', text: 'Case Officer:') }
    it { should have_selector('td', text: 'Detection Time:') }

    it { should have_selector('strong', text: 'No Actions Found') }
    it { should have_link('View Case') }

    describe "when someone takes action on a case" do
      let!(:action) { user.actions.create!(type: "Open",
                                           desc: "opened case #{case_file.id}",
                                           case_file_id: case_file.id) }

      before { visit case_files_path }
      it { should have_selector('strong', text: 'Last Action') }
    end

    describe "when there are no open cases" do
      before do
        case_file.update_attribute(:open, false)
        visit case_files_path
      end
      
      it { should have_selector('h4', text: 'None Found') }
    end
  end
end
