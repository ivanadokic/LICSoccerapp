class TeamsController < ApplicationController
    #skip_before_action :authorized, only: [:new, :create]
    def new
        @team = Team.new
    end

    def create 
        @team= Team.create (params.require(:team).permit(:name, :events, :schedules))
        if @team.valid? 
         session[:team_id] = @team.id
         @team.save
         redirect_to '/welcome'
        else
            render :new
        end
    end

end
