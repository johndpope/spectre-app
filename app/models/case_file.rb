# == Schema Information
#
# Table name: case_files
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  open           :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  type           :string(255)
#  content        :text
#  detection_time :datetime
#

class CaseFile < ActiveRecord::Base
  attr_accessible :type, :content, :detection_time, :open, :user_id
  belongs_to :user
  has_many :actions

  validates :type, presence: true
  validates :content, presence: true
  validates :detection_time, presence: true
  validates :open, presence: true
  validates :user_id, presence: true

  default_scope order: 'case_files.created_at DESC'
end
