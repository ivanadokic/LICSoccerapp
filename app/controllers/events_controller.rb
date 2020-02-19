class EventsController < ApplicationController
    def index
    end

    def new
        @event=Event.new
    end

    def create
        @event = Event.create (params.require(:event).permit(:location, :event_type, :start, :end))
        @event.save 
        if @event.save 
            redirect_to '/welcome'
            else
                render :new
            end
    
        
    end

end