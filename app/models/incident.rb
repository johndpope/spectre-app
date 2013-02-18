class Incident < ActiveRecord::Base
  attr_accessible :type, :content, :detection_time
  has_one :case_file

  validates :type, presence: true
  validates :content, presence: true
  validates :detection_time, presence: true

  default_scope order: 'incidents.created_at DESC'
end
