require 'spec_helper'

describe CaseFile do

  let(:user) { FactoryGirl.create(:user) }
  let(:incident) { FactoryGirl.create(:layering) }


  before do
    @case_file = incident.create_case_file(user_id: user.id, open: true)
  end

  subject { @case_file }

  it { should respond_to(:incident_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:open) }
  it { should be_valid }

  describe "when incident_id is not present" do
    before { @case_file.incident_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
    before { @case_file.user_id = nil }
    it { should_not be_valid }
  end

  describe "when open is not present" do
    before { @case_file.open = nil }
    it { should_not be_valid }
  end
end
