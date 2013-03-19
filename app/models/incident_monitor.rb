class IncidentMonitor < ActiveRecord::Base
  attr_accessible :settings, :type, :desc, :active
  has_many :actions

  validates :type, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true
  validates :settings, presence: true
  validates :active, presence: true, inclusion: { :in => [true, false] }
end
