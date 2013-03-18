require 'spec_helper'

describe "CaseFilePages" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:case_file) { FactoryGirl.create(:bid_layering_case, user: user) }

    before do
      sign_in user
      visit case_files_path
    end

    it { should have_selector('title', text: 'Open Cases') }
    it { should have_selector('h1', text: 'All Open Cases') }
    

    it { should have_selector('td', text: case_file.id.to_s) }
    it { should have_selector('td', text: 'Layering on the bid') }
    it { should have_selector('td', text: 'Acme') }
    it { should have_selector('td', text: 'SANp') }
    it { should have_selector('td', text: user.name) }

    it { should have_selector('a', :'data-content' => 'No Actions Found' ) }
    it { should have_link('View') }

    describe "when someone takes action on a case" do
      let!(:action) { user.actions.create!(type: "Open",
                                           desc: "opened case #{case_file.id}",
                                           content: "Open action",
                                           case_file_id: case_file.id) }

      before { visit case_files_path }
      it { should have_selector('a', :'data-original-title' => 'No Actions Found' ) }
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
    let!(:case_file1) { FactoryGirl.create(:bid_layering_case, user: user1) }
    let!(:case_file2) { FactoryGirl.create(:bid_layering_case, user: user2) }

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

      describe "after submitting comment" do

        let(:submit) { "Add Comment" }

        describe "with no text" do
          before { click_button submit }
          
            it { should have_link('Comment') }
        end

        describe "with text" do
          before do
            fill_in "content", with: "My comment"
            click_button submit
          end

          it { should have_link('Comment') }
        end
      end

      describe "looking at available case officers for case transfer" do
        it { should_not have_content("#{ user1.email }") }
        it { should have_content("#{ user2.email }") }
      end

      describe "after transferring a case" do

        let(:submit) { "Transfer" }
        let(:assigned_user) { case_file1.user_id }
        
        before do
          click_link "Transfer"
          fill_in "content", with: "Transferring"
          click_button submit
        end

        it { should have_content('Case transferred') }
        specify { case_file1.reload.user_id != assigned_user }

        describe "the new case owner should see transfer note" do
          before do
            sign_in user2
            visit my_cases_path
          end

          it { should have_selector('a', :'data-content' => 'transferred' ) }
          it { should have_selector('td', text: 'Open') }
          it { should have_selector('td', text: user2.name) }

          describe "and correct available actions" do
            before { visit case_file_path(case_file1) }

            it { should have_link('Comment') }
            it { should have_link('Transfer') }
            it { should have_link('Close') }
          end
        end
      end

      describe "after a case goes into pending close state" do

        let(:submit) { "Request Close Confirmation" }
        let(:assigned_user) { case_file1.user_id }
        
        before do
          click_link "Request Close"
          fill_in "content", with: "Requesting close"
          click_button submit
        end

        it { should have_content('confirm close') }
        specify { case_file1.reload.user_id != assigned_user }

        describe "the new case owner should see a request close note" do
          before do
            sign_in user2
            visit my_cases_path
          end

          it { should have_selector('a', :'data-content' => 'requested close' ) }
          it { should have_selector('td', text: 'Awaiting close confirmation') }
          it { should have_selector('td', text: user2.name) }

          describe "and correct available actions" do
            before { visit case_file_path(case_file1) }
            let(:confirm_button) { "Confirm Close" }
            let(:reject_button) { "Restore Case to Open Status" }

            it { should have_link('Confirm Close') }
            it { should have_link('Reject Close') }

            describe "and if the close is rejected" do
              before { click_button reject_button }
            
              it { should have_content('Case restored') }
              it { should have_selector('a', :'data-content' => 'rejected close' ) }
              it { should have_selector('td', text: 'Open') }
              it { should have_selector('td', text: user2.name) }
            end

            describe "and if the close is confirmed" do
              before { click_button confirm_button }

              it { should have_content('closed') }
           
              describe "the case should be in the archive" do
                before { visit closed_cases_path }

                it { should have_selector('td', text: 'Closed') }
              end
            end
          end
        end
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
