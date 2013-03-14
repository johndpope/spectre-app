class WashTradingMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper

  def modify
    if params["cancel"] == "Cancel"
      redirect_to incident_monitors_path
    else
      checked = checked?(params["ignore-internalized-trades"])
      settings = {
        "ignore-internalized-trades" => checked
      }

      monitor_settings = WashTradingMonitorSetting.new(settings)
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
          flash[:success] = "Settings for Wash trading modified."
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
