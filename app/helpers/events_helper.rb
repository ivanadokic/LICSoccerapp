module EventsHelper
  def display_nested_header
    if @schedule
     content_tag(:h2, @schedule.attending)
    else
     content_tag(:h1, "All the Events" )
    end
  end
  
  def display_nested_title
    if @schedule
     @schedule.attending
    else
     "Events"
    end
  end
end