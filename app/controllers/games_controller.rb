class GamesController < ApplicationController
   def new
      @game = Game.new 
   end
   
   def editplayers
      @team1 = Player.where("game_id = ? AND on_team1 = ?", params[:game_id], true)
      @team2 = Player.where("game_id = ? AND on_team1 = ?", params[:game_id], false)
   end
   
   def create
      @game = Game.new( game_params )
      @game.team1_score = @game.starting_score
      @game.team2_score = @game.starting_score
      @game.team1_shooting = 0
      @game.team2_shooting = 0
      @game.team1_player_count = 0
      @game.team2_player_count = 0
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
      @team1 = Player.where("game_id = ? AND on_team1 = ?", @game.id, true)
      @team2 = Player.where("game_id = ? AND on_team1 = ?", @game.id, false)
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
            params.require(:game).permit(:team1_score, :team1_shooting,
                                        :team1_player_count, :team2_score, :team2_shooting, 
                                        :team2_player_count, :team1_up, :starting_score, :playing)
        end
end