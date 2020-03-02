class SchedulesController < ApplicationController
    before_action :set_event, only: [:new, :create]
    
    def index
        if params[:event_id] && @event = Event.find_by_id(params[:event_id])
            @schedules = @event.schedules.attending
            
        else
            @schedules = Schedule.all
        end
    end

    def create  
        @schedule = current_player.schedules.build(params.require(:schedule).permit(:event_id, :attending))
        if @schedule.save 
           redirect_to event_path(@schedule.event_id)
        else
            render :new
        end
    end

    def new
     
        @schedule = @event.schedules.build
    end

    private
    
    def set_event
        @event = Event.find_by_id(params[:event_id])
    end

    
end