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
        case_file.update_attribute(:pending_close, true)
        visit case_files_path
      end
      
      it { should have_selector('h4', text: 'None Found') }
    end
  end

  describe "when visiting my cases" do

    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    let!(:case_file1) { FactoryGirl.create(:layering, user: user1) }
    let!(:case_file2) { FactoryGirl.create(:layering, user: user2) }

    before do
      sign_in user1
      visit my_cases_path
    end

    it { should have_selector('title', text: 'My Cases') }
    it { should have_selector('h1', text: 'My Open Cases') }

    it { should have_selector('td', text: case_file1.id.to_s) }
    it { should have_selector('td', text: user1.name) }

    it { should_not have_selector('td', text: case_file2.id.to_s) }   
    it { should_not have_selector('td', text: user2.name) }

    describe "when the user has no open cases" do
      
      before do
        case_file1.update_attribute(:open, false)
        visit my_cases_path
      end

      it { should have_selector('h4', text: 'None Found') }
    end

    describe "when viewing my own case" do

      before { visit case_file_path(case_file1) }
      
      it { should have_content(case_file1.id.to_s) }
      it { should have_content(user1.name) }
      it { should have_content('Open') }

      it { should have_content('Available Case Actions') }
      it { should have_link('Comment') }
      it { should have_link('Transfer') }
      it { should have_link('Close') }

      it { should_not have_link('Confirm Close') }
      it { should_not have_link('Reject Close') }
      it { should_not have_link('Reopen') }

      describe "when a case goes into pending close state" do
        before do
          case_file1.update_attribute(:open, true)
          case_file1.update_attribute(:pending_close, true)
          visit case_file_path(case_file1)
        end

        it { should have_content('Awaiting close confirmation') }

        it { should have_link('Confirm Close') }
        it { should have_link('Reject Close') }

        it { should_not have_link('Comment') }
        it { should_not have_link('Transfer') }
        it { should_not have_link('Reopen') }
      end

      describe "when a case goes into closed state" do
        before do
          case_file1.update_attribute(:open, false)
          case_file1.update_attribute(:pending_close, true)
          visit case_file_path(case_file1)
        end

        it { should have_content('Closed') }

        it { should have_link('Reopen') }
        
        it { should_not have_link('Comment') }
        it { should_not have_link('Transfer') }
        it { should_not have_link('Close') }
        it { should_not have_link('Confirm Close') }
        it { should_not have_link('Reject Close') }

      end
    end

    describe "when viewing another user's case" do
      before { visit case_file_path(case_file2) }

        it { should_not have_link('Reopen') }      
        it { should_not have_link('Comment') }
        it { should_not have_link('Transfer') }
        it { should_not have_link('Close') }
        it { should_not have_link('Confirm Close') }
        it { should_not have_link('Reject Close') }
    end
  end
end
