class SessionsController < ApplicationController

  def create
    @player = Player.find_by(username: params[:username])
    if @player && @player.authenticate(params[:password])

      session[:player_id] = @player.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end
 
  #logout
  def logout
    session.delete(:player_id) 
    redirect_to "/players/new"
  end

  def omniauth
    @player = Player.find_or_create_by(uid: auth[:uid]) do |p| #uid ensures its unique instance that we havent had before 
     p.username =auth[:info][:name] 
     p.age = 11
     p.password = SecureRandom.hex #give us random password 
    end
    @player.assign_team
  
    session[:player_id] = @player.id
    redirect_to '/welcome'
  end

  private
  def auth
    request.env['omniauth.auth']
  end

end


  