module ApplicationHelper

    def current_player    
        Player.find_by(id: session[:player_id])  
      end
  
      def logged_in?
          !current_player.nil?  
      end
      
end
