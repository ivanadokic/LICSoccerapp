class SchedulesController < ApplicationController
    def index
        if params[:event_id] && @team = Team.find_by_id(params[:event_id])
            @schedules = @schedules.team
           
        else
            @schedules = Schedule.all
        end
    end

    def create
    end
    
end