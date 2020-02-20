class EventsController < ApplicationController
    def new
        @event=Event.new
    end

    def create
        @event = Event.create (params.require(:event).permit(:location, :event_type, :start, :end, :team_id))
        #removed require and put permit
        @event.save 
        if @event.save 
          
           redirect_to event_path(@event)
        else
            render :new

        end

    end

    def index
        if params[:team_id] && @team = Team.find_by_id(params[:team_id])
            @events = @team.events
           
        else
            @events = Event.all
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        @event.update(params.require(:event).permit(location, :event_type, :start, :end))
        redirect_to @event
      end
    
    def destroy  
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to event_path
    end
    
    def show
        @event = Event.find_by_id(params[:id])

    end
    
end