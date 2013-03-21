class BidLayeringMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]
  before_filter :admin_user, only: [:show]

  def modify
    if params["cancel"] == "Cancel"
      redirect_to incident_monitors_path
    else
      checked = checked?(params["bid-prices-must-be-in-increasing-order"])
      settings = {
        "number-of-new-bids" => params["number-of-new-bids"],
        "number-of-cancels" => params["number-of-cancels"],
        "bid-prices-must-be-in-increasing-order" => checked,
        "length-of-monitoring-window" =>
          params["length-of-monitoring-window"]
      }

      monitor_settings = BidLayeringMonitorSetting.new(settings)
      save_monitor_settings(params['monitor_id'], monitor_settings, settings)
    end
  end
end
