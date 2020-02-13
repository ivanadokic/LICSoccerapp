class PlayersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
        @player = Player.new
    end

    def create 
        @player = Player.create (params.require(:player).permit(:username, :password))

        session[:player_id] = @player.id
        redirect_to '/welcome'
    end

end
