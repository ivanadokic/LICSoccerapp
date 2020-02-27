class EventsController < ApplicationController
    before_action :set_event, only: [:edit, :update, :destroy, :show]
    def new
        if params[:schedule_id] && @schedule = Schedule.find_by_id(params[:schedule_id])
            @event = @schedule.events.build
             #will instansiate new event associates with this schedule
        else #not nested
            @event=Event.new
        end
    end

  
    def create
        @event = Event.create (params.require(:event).permit(:location, :event_type, :start, :end, :team_id, :attending))
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
  
    end

    def update
    
        @event.update(params.require(:event).permit(:location, :event_type, :start, :end))
        if @event.save
            redirect_to event_path(@event)
         else
            render :edit
        end
    end
    
    def destroy  
        @event.destroy
        redirect_to events_path
    end
    
    def show   
    end
    
    private
    def set_event
        @event = Event.find_by_id(params[:id])
        if @event == nil
            redirect_to events_path
        end
    end

    
end