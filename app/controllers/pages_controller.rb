class PagesController < ApplicationController

    def home
        if logged_in?
            @team_players = current_player.team.players
        end
    end
end