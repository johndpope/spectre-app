# == Schema Information
#
# Table name: incident_monitors
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  desc       :text
#  settings   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

class IncidentMonitor < ActiveRecord::Base
  attr_accessible :settings, :type, :desc, :active
  has_many :actions

  validates :type, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true
  validates :settings, presence: true
  validates :active, presence: true, inclusion: { :in => [true, false] }
end
