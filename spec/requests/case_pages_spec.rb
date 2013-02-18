require 'spec_helper'

describe "CasePages" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit cases_path
    end

    it { should have_selector('title', text: 'Open Cases') }
    it { should have_selector('h1', text: 'All Open Cases') }
  end
end
