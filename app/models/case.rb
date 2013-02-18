class Case < ActiveRecord::Base
  attr_accessible :open, :user_id
  belongs_to :user
  belongs_to :incident
  has_many :actions

  validates :open, presence: true
  validates :user_id, presence: true
  validates :incident_id, presence: true

  default_scope order: 'cases.created_at DESC'
end