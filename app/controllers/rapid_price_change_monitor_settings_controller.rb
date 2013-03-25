class RapidPriceChangeMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]
  before_filter :admin_user, only: [:show]

  def modify
    if params['cancel'] == 'Cancel'
      redirect_to incident_monitors_path
    else
      settings = {
        'trade-price-equal-to-or-less-than-25' =>
          params['trade-price-equal-to-or-less-than-25'],
        'trade-price-between-25-and-150' =>
          params['trade-price-between-25-and-150'],
        'trade-price-equal-to-or-over-150' => 
          params['trade-price-equal-to-or-over-150'],
      }

      monitor_settings = RapidPriceChangeMonitorSetting.new(settings)
      save_monitor_settings(params['monitor_id'], monitor_settings, settings)      
    end
  end
end
