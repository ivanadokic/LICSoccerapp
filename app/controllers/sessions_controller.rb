class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create, :welcome]
  def welcome
  end
    
  def new
  end

  #def login
   # if @player.valid?
     # session[:player_id] = @player.id
      #redirect_to player_path(@player)
      #redirect_to '/welcome'
     #else
      
      #redirect_to '/signup'
    #end
  #end
 

  def create
    @player = Player.find_by(username: params[:username])
    if @player && @player.authenticate(params[:password])
      session[:player_id] = @player.id
      redirect_to '/welcome'
      else
      redirect_to '/login'
    end
  end
 
  def page_requires_login
  end

  #logout

  def destroy
      session.delete :player_id 
      redirect_to "/welcome"
  end

  def omniauth
    @player = Player.find_or_create_by(uid: auth[:uid]) do |p|
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


  