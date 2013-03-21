class AskLayeringMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]
  before_filter :admin_user, only: [:show]

  def modify
    if params["cancel"] == "Cancel"
      redirect_to incident_monitors_path
    else
      checked = checked?(params["ask-prices-must-be-in-increasing-order"])
      settings = {
        "number-of-new-asks" => params["number-of-new-asks"],
        "number-of-cancels" => params["number-of-cancels"],
        "ask-prices-must-be-in-increasing-order" => checked,
        "length-of-monitoring-window" =>
          params["length-of-monitoring-window"]
      }

      monitor_settings = AskLayeringMonitorSetting.new(settings)
      # Pass the monitor id, monitor settings, settings,
      save_monitor_settings(params['monitor_id'], monitor_settings, settings)      
    end
  end
end
