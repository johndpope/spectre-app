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

class Layering < CaseFile
end
