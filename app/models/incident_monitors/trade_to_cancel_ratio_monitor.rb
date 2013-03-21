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

class TradeToCancelRatioMonitor < IncidentMonitor
end
