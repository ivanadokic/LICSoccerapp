class EventsController < ApplicationController
    def index
    end

    def new
        @event=Event.new
    end


    def create
        @event = Event.create (params.permit(:event).permit(:location, :event_type, :start, :end))
        #removed require and put permit
        @event.save 
        if @event.save 
            redirect_to '/welcome'
        else
            render :new
        end
    end

end