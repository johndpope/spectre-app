class LargeUnfilledOrderMonitorSetting
  include ActiveAttr::Model

  attribute 'size-multiplier'
  attribute 'length-of-monitoring-window'

  validates 'size-multiplier',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 100 }
  validates 'length-of-monitoring-window',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 300 }
end