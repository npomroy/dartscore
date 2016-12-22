class PlayersController < ApplicationController
   def new
    @player = Player.new 
   end
   
   def edit
      @player = Player.find(params[:id]) 
   end
   
   def create
      @game = Game.find(params[:game_id])
      @team = Team.find(params[:team_id])
      @player = Player.new(player_params)
      @player.team_id = @team.id
      @player.is_away = false
      @player.best_shot = 0
      #not game -> team
      # hidden field from form
      #if 1 team1 if 2 team 2
      if @player.save
         if @team.player1_id == nil
            @team.player1_id = @player.id
         elsif @team.player2_id == nil
            @team.player2_id = @player.id
         elsif @team.player3_id == nil
            @team.player3_id = @player.id
         elsif @team.player4_id == nil
            @team.player4_id = @player.id
         elsif @team.player5_id == nil
            @team.player5_id = @player.id
         end
         @team.save
          flash[:success] = "Player created"
          redirect_to game_gamesetup_path(game_id: @game.id)
      else
          flash[:error] = "Player creation failed"
          render action: :new
      end
   end
   
   def show
      @player = Player.find(params[:id]) 
   end
   
   def update
      @player = Player.find(params[:id])
      if @player.update_attributes(player_params)
          flash[:success] = 'Player updated'
          redirect_to game_player_path(id: @player.id)
      else
          flash[:error] = "Player update failed"
          render action: :show
      end
   end
   
   def destroy
      Player.find(params[:id]).destroy
      redirect_to game_editplayers_path(game_id: params[:game_id])
   end
   
   def index
      @game = Game.find(params[:game_id])
      @players = Player.where("game_id = ?", @game.id)
   end
   
   private
        def player_params
           params.require(:player).permit(:game_id, :name, :is_away, :gamestats, :best_shot) 
        end
end