class GamesController < ApplicationController
   def new
      @game = Game.new 
   end
   
   def editplayers
      @game = Game.find(params[:game_id])
      @team1 = Team.find(@game.team1_id)
      @team2 = Team.find(@game.team2_id)
   end
   
   def create
      @game = Game.new( game_params )
      @game.team1_up = true
      @game.playing = false
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
      @team1 = Team.find(@game.team1_id)
      @team2 = Team.find(@game.team2_id)
   end
   
   def update
      @game = Game.find(params[:id])
      if @game.update_attributes(game_params)
          flash[:success] = "Game update successful"
          redirect_to game_path(id: @game.id)
      else
          flash[:error] = "Game update failed"
          redirect_to game_path(id: @game.id)
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
            params.require(:game).permit(:team1_up, :starting_score, :playing, :team1_id, :team2_id)
        end
end