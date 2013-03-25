class RapidPriceChangeMonitorSetting
  include ActiveAttr::Model

  attribute 'trade-price-equal-to-or-less-than-25'
  attribute 'trade-price-between-25-and-150'
  attribute 'trade-price-equal-to-or-over-150'

  validates 'trade-price-equal-to-or-less-than-25',
            presence: true,
            numericality: { greater_than_or_equal_to: 0.1,
                            less_than_or_equal_to: 300 }
  validates 'trade-price-between-25-and-150',
            presence: true,
            numericality: { greater_than_or_equal_to: 0.1,
                            less_than_or_equal_to: 300 }
  validates 'trade-price-equal-to-or-over-150',
            presence: true,
            numericality: { greater_than_or_equal_to: 0.1,
                            less_than_or_equal_to: 300 }
end