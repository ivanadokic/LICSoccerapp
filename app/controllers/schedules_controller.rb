class SchedulesController < ApplicationController
    def index
        if params[:event_id] && @team = Event.find_by_id(params[:event_id])
            @schedules = @events.team
            #Event.attending.('yes')
        else
            @schedules = Schedule.all
        end
    end

    def create  
  
        @event = Event.find_by_id(params[:event_id])
        @schedule = current_player.schedules.build(params.require(:schedule).permit(:event_id, :attending))
        if @schedule.save 
           redirect_to event_path(@schedule.event_id)
        else
            render :new
        end
    end

    def new
        @event = Event.find_by_id(params[:event_id])
        @schedule = @event.schedules.build
       #@event = Event.new
       #@event.schedules.build
    end
    
end