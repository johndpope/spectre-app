class AskLayeringMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper
  before_filter :signed_in_user, only: [:modify]

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
      settings.merge!(settings) { |k, v| try_to_i(v) }
      if monitor_settings.valid?
        monitor = IncidentMonitor.find(params['monitor_id'])
        if settings.to_json == monitor.settings
          redirect_to incident_monitors_path, notice: "No modifications."
        else
          monitor.update_attributes(settings: settings.to_json)
          desc = JSON.parse(monitor.desc, symbolize_names: true)
          new_action = current_user.actions.new(modify_monitor_settings_action(
                                                  monitor.id, desc))
          new_action.save
          flash[:success] = "Settings for Layering on the ask modified."
          redirect_to incident_monitors_path
        end  
      else
        redirect_to incident_monitor_path(params['monitor_id'],
          errors: monitor_settings.errors.messages,
          new_settings: settings,
          render_new_settings: true)
      end
    end
  end
end
