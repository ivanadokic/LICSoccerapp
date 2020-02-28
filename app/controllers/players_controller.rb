class PlayersController < ApplicationController
    #skip_before_action :authorized, only: [:new, :create, :show]
    def new
        if logged_in?
            redirect_to player_path(current_player)
        else
            @player = Player.new
        end
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
    def show
        @player = Player.find_by_id(params[:id])
    end

    
    

end
