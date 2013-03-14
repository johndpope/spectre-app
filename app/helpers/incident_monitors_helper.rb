module IncidentMonitorsHelper

  def time_unit(field)
    if field == 'Length of monitoring window'
      'Length of monitoring window (secs)'
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
end
