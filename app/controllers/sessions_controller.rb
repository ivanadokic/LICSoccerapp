class SessionsController < ApplicationController
    def new
    end

    def create
        @player = Player.find_by(:email) =>params[:email]
        if @player
            @session:[current_player_id] = @player.id
            redirect_to '/home'
        else
        redirect_to '/login'
        end
    end
  
        #elsif User.find_by(username: params[:user][:username])
          #redirect '/login'
        #else
         # Create a new user
          #@player =Player.create(params[:user])
  
         # log them in, look at session hash and add a key to the session hash we call it user_id
          #session[:player_id] = @player.id
    
         # redirect them to a show page
           #redirect "/players"
        #end
end
    
  
  

      
    
  
      
  

