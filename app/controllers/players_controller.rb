class PlayersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
        @player = Player.new
    end

    def create 
        @player = Player.create (params.require(:player).permit(:username, :password, :age))
        if @player.valid? 
        session[:player_id] = @player.id
        @player.assign_team
        redirect_to '/welcome'
        else
            render :new
        end
    end

end
