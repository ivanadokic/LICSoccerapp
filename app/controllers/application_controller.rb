class ApplicationController < ActionController::Base
    #before_action :authorized #The macro before_action requires the authorized method to run before any other action is taken. 
    
    include ApplicationHelper #so i can use login and current_player anywhere in my app

    #enable :sessions
    set :session_secret, "super_secret_code_word" #encript our sessions



    def authorized
        redirect_to login_path unless logged_in?
    end
    
end
