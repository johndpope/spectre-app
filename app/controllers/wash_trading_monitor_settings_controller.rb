class WashTradingMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]
  before_filter :admin_user, only: [:show]

  def modify
    if params["cancel"] == "Cancel"
      redirect_to incident_monitors_path
    else
      checked = checked?(params["ignore-internalized-trades"])
      settings = {
        "ignore-internalized-trades" => checked
      }

      monitor_settings = WashTradingMonitorSetting.new(settings)
      save_monitor_settings(params['monitor_id'], monitor_settings, settings)
    end
  end
end
