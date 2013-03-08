class IncidentMonitor < ActiveRecord::Base
  attr_accessible :desc, :settings, :type
  has_many :actions

  validates :type, presence: true
  validates :desc, presence: true
  validates :settings, presence: true
end
