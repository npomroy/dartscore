class GamesController < ApplicationController
   def new
      @game = Game.new 
   end
   
   def create
      @game = Game.new( game_params )
      if @game.save
          flash[:success] = "Game started"
          redirect_to game_path(id: @game.id)
      else
          flash[:error] = "Game creation failed"
          render action: :new
      end
   end
   
   def show
      @game = Game.find(params[:id]) 
      @players = Player.where("game_id = ?", @game.id)
   end
   
   def update
      @game = Game.find(params[:id])
      if @game.update_attributes(game_params)
          flash[:success] = "Game update successful"
          render action: :show
      else
          flash[:error] = "Game update failed"
          render action: :show
      end
   end
   
   def destroy
      Game.find(params[:id]).destroy
      redirect_to root_path
   end
   
   def index
      @games = Game.all 
   end
   
   private
        def game_params
            params.require(:game).permit(:team1_score, :team1_shooting,
                                        :team1_player_count, :team2_score, :team2_shooting, 
                                        :team2_player_count, :team1_up, :starting_score, :playing)
        end
end