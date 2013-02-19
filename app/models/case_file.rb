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