class GamesController < ApplicationController
   def new
      @game = Game.new 
   end
   
   def editplayers
      @game = Game.find(params[:game_id])
      @team1 = Team.find(@game.team1_id)
      @team2 = Team.find(@game.team2_id)
   end
   
   def gamesetup
      @game = Game.find(params[:game_id])
      if @game.team1_id == nil
         @team1 = Team.new
      else
         @team1 = Team.find(@game.team1_id)
         if @team1.player1_id == nil
            @t1p1 = Player.new
         else
            @t1p1 = Player.find(@team1.player1_id)
         end
         if @team1.player2_id == nil
            @t1p2 = Player.new
         else
            @t1p2 = Player.find(@team1.player1_id)
         end
         if @team1.player3_id == nil
            @t1p3 = Player.new
         else
            @t1p3 = Player.find(@team1.player1_id)
         end
         if @team1.player4_id == nil
            @t1p4 = Player.new
         else
            @t1p4 = Player.find(@team1.player1_id)
         end
         if @team1.player5_id == nil
            @t1p5 = Player.new
         else
            @t1p5 = Player.find(@team1.player1_id)
         end
      end
      if @game.team2_id == nil
         @team2 = Team.new
      else
         @team2 = Team.find(@game.team2_id)
      end
   end
   
   def create
      @game = Game.new( game_params )
      @game.team1_up = true
      @game.playing = false
      if @game.save
          flash[:success] = "Game started"
          redirect_to game_gamesetup_path(game_id: @game.id)
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
            params.require(:game).permit(:name, :team1_up, :starting_score, :playing, :team1_id, :team2_id)
        end
end