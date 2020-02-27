module PlayersHelper

  def display_nested_header
    if @schedules
      content_tag(:h2, @schedules.name)
      else
      content_tag(:h1, "All the Events" )
    end
  end
  def display_nested_title
    if @schedules
      @schedules.name
      else
      "Events"
    end
  end  
end
