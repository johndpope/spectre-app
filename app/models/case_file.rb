# == Schema Information
#
# Table name: case_files
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  open           :boolean          default(TRUE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  type           :string(255)
#  content        :text
#  detection_time :datetime
#  pending_close  :boolean          default(FALSE)
#  participants   :string(255)
#  name           :string(255)
#  symbol         :string(255)
#

class CaseFile < ActiveRecord::Base
  attr_accessible :type, :content, :detection_time, :open, :user_id,
                  :pending_close, :participants, :name, :symbol
  belongs_to :user
  has_many :actions

  validates :type, presence: true
  validates :content, presence: true
  validates :detection_time, presence: true
  validates :user_id, presence: true
  validates :participants, presence: true
  validates :name, presence: true
  validates :symbol, presence: true

  default_scope order: 'case_files.created_at DESC'
end
