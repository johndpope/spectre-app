module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Spectre"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def convert_timestamp(t)
    milliseconds = t.to_s.last(3)
    Time.zone.at(t/1000.0).strftime("%Y-%m-%d %H:%M:%S." + milliseconds + " %Z")
  end

end
