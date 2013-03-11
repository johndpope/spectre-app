require 'spec_helper'

describe "IncidentMonitors" do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit incident_monitors_path
    end

    it { should have_selector('title', text: 'Incident Monitors') }
    it { should have_selector('h1', text: 'Incident Monitors') }
  end
end
