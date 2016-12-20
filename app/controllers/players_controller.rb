class PlayersController < ApplicationController
   def new
    @player = Player.new 
   end
   
   def create
       @game = Game.find(params[:game_id])
      @player = Player.new(player_params)
      @player.game_id = @game.id
      if @player.save
          flash[:success] = "Player created"
          redirect_to game_player_path(game_id: @player.game_id, id: @player.id)
      else
          flash[:error] = "Player creation failed"
          render action: :new
      end
   end
   
   def show
      @player = Player.find(params[:id]) 
   end
   
   def index
      @game = Game.find(params[:game_id])
      @players = Player.where("game_id = ?", @game.id)
   end
   
   private
        def player_params
           params.require(:player).permit(:game_id, :name, :on_team1, :is_away, :gamestats, :best_shot) 
        end
end