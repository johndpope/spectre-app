# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  desc       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Action < ActiveRecord::Base
  attr_accessible :desc
  belongs_to :user

  validates :user_id, presence: true
  validates :desc, presence: true

  default_scope order: 'actions.created_at DESC'
end
