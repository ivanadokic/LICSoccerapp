class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create, :welcome]
  def welcome
  end
    
  def new
  end
  def login
  end

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
      redirect_to "/signup"
    end

  #def omniauth
   #@player = Player.from_omniauth(auth)
   #@player.save
   # session[:player_id] = @player.id
  #end
  
  def omniauth

    @player = Player.find_or_create_by(uid: auth[:uid]) do |p|

     p.username = auth[:info][:name]
     p.password = SecureRandom.hex
    
   
     end
    session[:player_id] = @player.id
    redirect_to '/welcome'
    
  end
  
  private
  def auth
    request.env['omniauth.auth']
  end


  
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |player|
     player.user_name = auth.info.name
      player.email = auth.info.email
      player.password = SecureRandom.hex
    end
  end  
end

  