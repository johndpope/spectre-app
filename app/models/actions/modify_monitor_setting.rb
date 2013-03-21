# == Schema Information
#
# Table name: actions
#
#  id                  :integer          not null, primary key
#  desc                :string(255)
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  type                :string(255)      not null
#  content             :text
#  case_file_id        :integer
#  incident_monitor_id :integer
#

class ModifyMonitorSetting < Action
end
