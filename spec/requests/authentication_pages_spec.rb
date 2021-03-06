require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1', text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with valid information but not activated" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        user.toggle!(:activated)
        sign_in user
      end
      
      it { should have_selector('title', text: 'Sign In') }
      it { should have_button('Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'activated') }
    end

    describe "with valid information and activated" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        visit signin_path
        sign_in user
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('My Cases', href: my_cases_path) }
      it { should have_link('All Cases', href: case_files_path) }
      it { should have_link('Incident Monitors', href: incident_monitors_path) }
      it { should have_link('Users', href: users_path) }
      it { should have_link('Case Archive', href: closed_cases_path) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      specify { Action.first.type.should == "SignIn" }
      specify { Action.first.desc.should == "signed in" }

      describe "followed by signout" do
        before { click_link "Sign Out" }

        specify { Action.first.type.should == "SignOut" }
        specify { Action.first.desc.should == "signed out" }
        it { should have_button('Sign In') }
      end
    end

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_selector('title', text: 'Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "About" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end

  describe "Authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Sign In"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit User')
          end

          describe "when signing in again" do
            before do
              delete signout_path
              visit signin_path
              fill_in "Email",    with: user.email
              fill_in "Password", with: user.password
              click_button "Sign In"
            end

            it "should render the default (profile) page" do
              page.should have_selector('title', text: user.name)
            end
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_button('Sign In' ) }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_button('Sign In') }
        end
      end
    end

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: 'Edit user') }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end
