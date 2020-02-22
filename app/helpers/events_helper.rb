module EventsHelper
    def display_nested_header
      if @schedule
        content_tag(:h2, @schedule.name)
      else
        content_tag(:h1, "All the Events" )
      end
    end
  
    def display_nested_title
      if @schedule
        @schedule.name
      else
       "Events"
      end
    end
  
  
  end