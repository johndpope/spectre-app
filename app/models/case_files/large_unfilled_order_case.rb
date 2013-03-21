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

class LargeUnfilledOrderCase < CaseFile
end
