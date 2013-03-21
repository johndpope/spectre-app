module UsersHelper

  # Returns the error message
  def full_title(page_title)
    base_title = 'Spectre'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
