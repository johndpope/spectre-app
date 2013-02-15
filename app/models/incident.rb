class Incident < ActiveRecord::Base
  attr_accessible :type
  has_one :case

  validates :type, presence: true

  default_scope order: 'incidents.created_at DESC'
end
