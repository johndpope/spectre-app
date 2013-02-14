# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  desc       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#

require 'spec_helper'

describe Action do

  let(:user) { FactoryGirl.create(:user) }
  before { @action = user.actions.build(desc: "Signed-in", type: "SignIn") }
  
  subject { @action }

  it { should respond_to(:desc) }
  it { should respond_to(:user_id) }
  it { should respond_to(:type) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @action.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @action.desc = " " }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Action.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user id is not present" do
    before { @action.user_id = nil }
    it { should_not be_valid }
  end

  describe "when type is not present" do
    before { @action.type = nil }
    it { should_not be_valid }
  end
end
