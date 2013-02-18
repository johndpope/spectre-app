require 'spec_helper'

describe Incident do

  before do
    @incident = Incident.new(type: "Layering", content: "violations!",
                             detection_time: Time.now.utc.iso8601)
  end

  subject { @incident }

  it { should respond_to(:type) }
  it { should respond_to(:content) }
  it { should respond_to(:detection_time) }
  it { should be_valid }

  describe "when type is not present" do
    before { @incident.type = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @incident.content = nil }
    it { should_not be_valid }
  end

  describe "when detection time is not present" do
    before { @incident.detection_time = nil }
    it { should_not be_valid }
  end

end
