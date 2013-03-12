class BidLayeringMonitorSettingsController < ApplicationController
  include IncidentMonitorsHelper

  def update
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
          flash[:success] = "Settings for Layering on the bid modified."
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

  protected

    def checked?(value)
      value == 'true' ? true : false
    end

    def try_to_i(str, default = str)
      str =~ /^-?\d+$/ ? str.to_i : str
    end

end