class PlayersController < ApplicationController

    def new
        if session[:cuurent_player_id]
            redirect_to "/", :notice => "Already logged in!"
        end
    end

    def create
        @player = Player.new
        Player.create(username: 'username', name: 'name', age: 'age', team_id: 'team')
        @player.save
        
        redirect_to "/login"
    end

end
