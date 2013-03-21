class LargeUnfilledOrderMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]
  before_filter :admin_user, only: [:show]

  def modify
    if params['cancel'] == 'Cancel'
      redirect_to incident_monitors_path
    else
      settings = {
        'size-multiplier' => params["size-multiplier"],
        'length-of-monitoring-window' =>
          params['length-of-monitoring-window']
      }

      monitor_settings = LargeUnfilledOrderMonitorSetting.new(settings)
      save_monitor_settings(params['monitor_id'], monitor_settings, settings)
    end
  end
end
