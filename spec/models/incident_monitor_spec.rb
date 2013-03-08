require 'spec_helper'

describe IncidentMonitor do

  let(:incident_monitor) { FactoryGirl.create(:incident_monitor) }
  
  subject { incident_monitor }

  it { should respond_to(:type) }
  it { should respond_to(:desc) }
  it { should respond_to(:settings) }
  it { should be_valid }

  describe "when type is not present" do
    before { incident_monitor.type = nil }
    it { should_not be_valid }
  end
  
  describe "when desc is not present" do
    before { incident_monitor.desc = nil }
    it { should_not be_valid }
  end

  describe "when settings is not present" do
    before { incident_monitor.settings = nil }
    it { should_not be_valid }
  end
end