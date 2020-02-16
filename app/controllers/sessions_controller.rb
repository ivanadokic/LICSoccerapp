class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
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
    reset_session
    redirect_to "/signup"
  end
  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end
  private
  def auth
    request.env['omniauth.auth']
  end
  
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end  
end
  