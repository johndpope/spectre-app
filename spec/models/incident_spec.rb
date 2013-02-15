require 'spec_helper'

describe Incident do

  before do
    @incident = Incident.new(type: "Layering")
  end

  subject { @incident }

  it { should respond_to(:type) }
  it { should be_valid }

  describe "when type is not present" do
    before { @incident.type = nil }
    it { should_not be_valid }
  end
end
