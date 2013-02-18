# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  desc       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#
class Action < ActiveRecord::Base
  attr_accessible :desc, :type, :content, :case_file_id
  belongs_to :user
  belongs_to :case_file

  validates :user_id, presence: true
  validates :desc, presence: true
  validates :type, presence: true

  default_scope order: 'actions.created_at DESC'
end
