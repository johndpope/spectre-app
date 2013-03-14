class TradeToCancelRatioMonitorSetting
  include ActiveAttr::Model

  attribute 'alert-when-ratio-is-below'
  attribute 'length-of-monitoring-window'

  validates 'alert-when-ratio-is-below',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 100 }
  validates 'length-of-monitoring-window',
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 300 }
end