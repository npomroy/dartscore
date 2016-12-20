class PlayersController < ApplicationController
   def new
    #   @player = Player.new 
   end
   
   def create
      @player = Player.new(player_params)
      if @player.save
          flash[:success] = "Player created"
          redirect_to root_path
      else
          flash[:error] = "Player creation failed"
          render action: :new
      end
   end
   
   private
        def player_params
           params.require(:player).permit(:game_id, :name, :on_team1, :is_away, :record, :best_shot) 
        end
end