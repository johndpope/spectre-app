class AskLayeringMonitorSetting
  include ActiveAttr::Model

  attribute 'number-of-new-asks'
  attribute 'number-of-cancels'
  attribute 'ask-prices-must-be-in-decreasing-order'
  attribute 'length-of-monitoring-window'

  validates 'number-of-new-asks',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 100 }
  validates 'number-of-cancels',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 100 }
  validates 'length-of-monitoring-window',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 300 }
end