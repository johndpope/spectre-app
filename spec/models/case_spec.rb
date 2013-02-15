require 'spec_helper'

describe Case do

  let(:user) { FactoryGirl.create(:user) }
  let(:incident) { FactoryGirl.create(:layering) }


  before do
    @case = incident.create_case(user_id: user.id, open: true)
  end

  subject { @case }

  it { should respond_to(:incident_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:open) }
  it { should be_valid }

  describe "when incident_id is not present" do
    before { @case.incident_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
    before { @case.user_id = nil }
    it { should_not be_valid }
  end

  describe "when open is not present" do
    before { @case.open = nil }
    it { should_not be_valid }
  end
end
