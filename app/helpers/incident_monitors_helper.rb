module IncidentMonitorsHelper

  def add_unit(field)
    if field == 'Length of monitoring window'
      field + ' (secs)'
    elsif field == 'Alert when ratio is below'
      field + ' (pct)'
    else
      field
    end
  end

  def modify_monitor_settings_action(id, monitor_desc)
   {
      desc: "modified incident monitor settings for #{ monitor_desc[:name] }",
      type: "ModifyMonitorSetting",
      content: "Modify monitor setting action",
      incident_monitor_id: id,
    }
  end

  def populate_field(field, render_new, old_settings, new_settings)
    if render_new
      new_settings[field]
    else
      old_settings[field]
    end
  end

  def to_boolean(val)
    if val.class == String
      val == 'true'
    else
      val
    end
  end

  def checked?(value)
    value == 'true' ? true : false
  end

  def try_to_i(str, default = str)
    str =~ /^-?\d+$/ ? str.to_i : str
  end

  def save_monitor_settings(monitor_id, cur_settings, new_settings)
    new_settings.merge!(new_settings) { |k, v| try_to_i(v) }
    if cur_settings.valid?
      monitor = IncidentMonitor.find(monitor_id)
      if new_settings.to_json == monitor.settings
        redirect_to incident_monitors_path, notice: "No modifications."
      else
        monitor.update_attributes(settings: new_settings.to_json)
        desc = JSON.parse(monitor.desc, symbolize_names: true)
        new_action = current_user.actions.new(modify_monitor_settings_action(
                                                monitor.id, desc))
        new_action.save
        flash[:success] = "Settings for #{ desc[:'name'] } modified."
        redirect_to incident_monitors_path
      end  
    else
      redirect_to incident_monitor_path(params['monitor_id'],
        errors: cur_settings.errors.messages,
        new_settings: new_settings,
        render_new_settings: true)
    end
  end
end
