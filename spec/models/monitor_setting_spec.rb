require 'spec_helper'

describe BidLayeringMonitorSetting do
  before do
    @setting = BidLayeringMonitorSetting.new(
      "number-of-new-bids" => 1,
      "number-of-cancels" => 1,
      "bid-prices-must-be-in-increasing-order" => false,
      "length-of-monitoring-window" => 1)
  end

  subject { @setting }

  it { should respond_to("number-of-new-bids") }
  it { should respond_to("number-of-cancels") }
  it { should respond_to("bid-prices-must-be-in-increasing-order") }
  it { should respond_to("length-of-monitoring-window") }
  it { should be_valid }

  describe "when number of bids is not present" do
    before { @setting["number-of-new-bids"] = nil }
    it { should_not be_valid }
  end

  describe "when number of bids is not numerical" do
    before { @setting["number-of-new-bids"] = "word" }
    it { should_not be_valid }
  end

  describe "when number of bids is not an integer" do
    before { @setting["number-of-new-bids"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when number of bids is less than zero" do
    before { @setting["number-of-new-bids"] = -1 }
    it { should_not be_valid }
  end

  describe "when number of bids is greater than 100" do
    before { @setting["number-of-new-bids"] = 101 }
    it { should_not be_valid }
  end

  describe "when number of cancels is not present" do
    before { @setting["number-of-cancels"] = nil }
    it { should_not be_valid }
  end

  describe "when number of cancels is not numerical" do
    before { @setting["number-of-cancels"] = "word" }
    it { should_not be_valid }
  end

  describe "when number of cancels is not an integer" do
    before { @setting["number-of-cancels"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when number of cancels is less than one" do
    before { @setting["number-of-cancels"] = 0 }
    it { should_not be_valid }
  end

  describe "when number of cancels is greater than 100" do
    before { @setting["number-of-cancels"] = 101 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not present" do
    before { @setting["length-of-monitoring-window"] = nil }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not numerical" do
    before { @setting["length-of-monitoring-window"] = "word" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not an integer" do
    before { @setting["length-of-monitoring-window"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is less than one" do
    before { @setting["length-of-monitoring-window"] = 0 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is greater than 300" do
    before { @setting["length-of-monitoring-window"] = 301 }
    it { should_not be_valid }
  end
end

describe AskLayeringMonitorSetting do
  before do
    @setting = AskLayeringMonitorSetting.new(
      "number-of-new-asks" => 1,
      "number-of-cancels" => 1,
      "ask-prices-must-be-in-decreasing-order" => false,
      "length-of-monitoring-window" => 1)
  end

  subject { @setting }

  it { should respond_to("number-of-new-asks") }
  it { should respond_to("number-of-cancels") }
  it { should respond_to("ask-prices-must-be-in-decreasing-order") }
  it { should respond_to("length-of-monitoring-window") }
  it { should be_valid }

  describe "when number of asks is not present" do
    before { @setting["number-of-new-asks"] = nil }
    it { should_not be_valid }
  end

  describe "when number of asks is not numerical" do
    before { @setting["number-of-new-asks"] = "word" }
    it { should_not be_valid }
  end

  describe "when number of asks is not an integer" do
    before { @setting["number-of-new-asks"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when number of asks is less than zero" do
    before { @setting["number-of-new-asks"] = -1 }
    it { should_not be_valid }
  end

  describe "when number of asks is greater than 100" do
    before { @setting["number-of-new-asks"] = 101 }
    it { should_not be_valid }
  end

  describe "when number of cancels is not present" do
    before { @setting["number-of-cancels"] = nil }
    it { should_not be_valid }
  end

  describe "when number of cancels is not numerical" do
    before { @setting["number-of-cancels"] = "word" }
    it { should_not be_valid }
  end

  describe "when number of cancels is not an integer" do
    before { @setting["number-of-cancels"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when number of cancels is less than one" do
    before { @setting["number-of-cancels"] = 0 }
    it { should_not be_valid }
  end

  describe "when number of cancels is greater than 100" do
    before { @setting["number-of-cancels"] = 101 }
    it { should_not be_valid }
  end

    describe "when length of monitoring window is not present" do
    before { @setting["length-of-monitoring-window"] = nil }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not numerical" do
    before { @setting["length-of-monitoring-window"] = "word" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not an integer" do
    before { @setting["length-of-monitoring-window"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is less than one" do
    before { @setting["length-of-monitoring-window"] = 0 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is greater than 300" do
    before { @setting["length-of-monitoring-window"] = 301 }
    it { should_not be_valid }
  end
end
 
describe TradeToCancelRatioMonitorSetting do
  before do
    @setting = TradeToCancelRatioMonitorSetting.new(
      "alert-when-ratio-is-below" => 1,
      "length-of-monitoring-window" => 1)
  end

  subject { @setting }

  it { should respond_to("alert-when-ratio-is-below") }
  it { should respond_to("length-of-monitoring-window") }
  it { should be_valid }

  describe "when alert ratio is not present" do
    before { @setting["alert-when-ratio-is-below"] = nil }
    it { should_not be_valid }
  end

  describe "when alert ratio is not numerical" do
    before { @setting["alert-when-ratio-is-below"] = "word" }
    it { should_not be_valid }
  end

  describe "when alert ratio is not an integer" do
    before { @setting["alert-when-ratio-is-below"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when alert ratio is less than one" do
    before { @setting["alert-when-ratio-is-below"] = 0 }
    it { should_not be_valid }
  end

  describe "when alert ratio is greater than 100" do
    before { @setting["alert-when-ratio-is-below"] = 101 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not present" do
    before { @setting["length-of-monitoring-window"] = nil }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not numerical" do
    before { @setting["length-of-monitoring-window"] = "word" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not an integer" do
    before { @setting["length-of-monitoring-window"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is less than one" do
    before { @setting["length-of-monitoring-window"] = 0 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is greater than 300" do
    before { @setting["length-of-monitoring-window"] = 301 }
    it { should_not be_valid }
  end
end

describe WashTradingMonitorSetting do
  before do
    @setting = WashTradingMonitorSetting.new(
      "ignore-internalized-trades" => true)
  end

  subject { @setting }

  it { should respond_to("ignore-internalized-trades") }
  it { should be_valid }
end

describe LargeUnfilledOrderMonitorSetting do
  before do
    @setting = LargeUnfilledOrderMonitorSetting.new(
      "size-multiplier" => 1,
      "length-of-monitoring-window" => 1)
  end

  subject { @setting }

  it { should respond_to("size-multiplier") }
  it { should respond_to("length-of-monitoring-window") }
  it { should be_valid }

  describe "when size multiplier is not present" do
    before { @setting["size-multiplier"] = nil }
    it { should_not be_valid }
  end

  describe "when size multiplier is not numerical" do
    before { @setting["size-multiplier"] = "word" }
    it { should_not be_valid }
  end

  describe "when size multiplier is not an integer" do
    before { @setting["size-multiplier"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when size multiplier is less than one" do
    before { @setting["size-multiplier"] = 0 }
    it { should_not be_valid }
  end

  describe "when size multiplier is greater than 100" do
    before { @setting["size-multiplier"] = 101 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not present" do
    before { @setting["length-of-monitoring-window"] = nil }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not numerical" do
    before { @setting["length-of-monitoring-window"] = "word" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is not an integer" do
    before { @setting["length-of-monitoring-window"] = "1.0" }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is less than one" do
    before { @setting["length-of-monitoring-window"] = 0 }
    it { should_not be_valid }
  end

  describe "when length of monitoring window is greater than 300" do
    before { @setting["length-of-monitoring-window"] = 301 }
    it { should_not be_valid }
  end
end