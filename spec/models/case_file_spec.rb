require 'spec_helper'

describe CaseFile do

  let(:user) { FactoryGirl.create(:user) }
  let(:case_file) { FactoryGirl.create(:layering, user: user) }

  subject { case_file }

  it { should respond_to(:type) }
  it { should respond_to(:content) }
  it { should respond_to(:detection_time) }
  it { should respond_to(:user_id) }
  it { should respond_to(:open) }
  it { should be_valid }

  describe "when type is not present" do
    before { case_file.type = nil }
    it { should_not be_valid }
  end
  
  describe "when content is not present" do
    before { case_file.content = nil }
    it { should_not be_valid }
  end

  describe "when detection time is not present" do
    before { case_file.detection_time = nil }
    it { should_not be_valid }
  end

  describe "when user id time is not present" do
    before { case_file.user_id = nil }
    it { should_not be_valid }
  end

  describe "when open is not present" do
    before { case_file.open = nil }
    it { should_not be_valid }
  end
end
