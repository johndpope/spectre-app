# == Schema Information
#
# Table name: incident_monitors
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  desc       :text
#  settings   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

require 'spec_helper'

describe IncidentMonitor do

  before do
    @incident_monitor = IncidentMonitor.new(
      type: "BidLayeringMonitor",
      desc: { "name" => "Layering on the bid",
              "info" => "Layering on the bid" }.to_json,
      settings: { "number-of-new-bids" => 4,
                  "number-of-cancels" => 4,
                  "length-of-monitoring-window" => 5 }.to_json,
      active: true)
  end
  
  subject { @incident_monitor }

  it { should respond_to(:type) }
  it { should respond_to(:desc) }
  it { should respond_to(:settings) }
  it { should respond_to(:active) }
  it { should be_valid }

  describe "when type is not present" do
    before { @incident_monitor.type = nil }
    it { should_not be_valid }
  end

  describe "when type already exists" do
    before do
      same_incident_monitor = @incident_monitor.dup
      same_incident_monitor.type = @incident_monitor.type.upcase
      same_incident_monitor.save
    end

    it { should_not be_valid }
  end
  
  describe "when desc is not present" do
    before { @incident_monitor.desc = nil }
    it { should_not be_valid }
  end

  describe "when settings is not present" do
    before { @incident_monitor.settings = nil }
    it { should_not be_valid }
  end

  describe "when active state is not present" do
    before { @incident_monitor.active = nil }
    it { should_not be_valid }
  end

  describe "when active state is something other than boolean" do
    before { @incident_monitor.active = "neither" }
    it { should_not be_valid }
  end
end
