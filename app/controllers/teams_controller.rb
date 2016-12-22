class TeamsController < ApplicationController
   def new
      @team = Team.new 
   end
   
   def create
      @team = Team.new( team_params )
      @game = Game.find(params[:game_id])
      @team.game_id = @game.id
      if @game.team2_id == nil
         if @team.save
            if @game.team1_id == nil
               @game.team1_id = @team.id
               @game.save
            else
               @game.team2_id = @team.id
               @game.save
            end
             flash[:success] = "Team created"
             redirect_to game_gamesetup_path(id: params[:game_id])
         else
             flash[:error] = "Team creation failed"
             redirect_to game_gamesetup_path(id: params[:game_id])
         end
      else
         flash[:error] = "Game already has two teams"
         redirect_to game_path(id: @game.id)
      end
   end
   
   def show
      @team = Team.find(params[:id]) 
   end
   
   def update
      @team = Team.find(params[:id])
      if @team.update_attributes( team_params )
          flash[:success] = "Team updated"
          redirect_to game_team_path(id: @team.id)
      else
          flash[:error] = "team update failed"
          render action: :show
      end
   end
   
   def destroy
      Team.find(params[:id]).destroy
      redirect_to root_path
   end
   
   private
        def team_params
           params.require(:team).permit(:player1_id, :player2_id, :player3_id, 
                                       :player4_id, :player5_id, :name, :score, 
                                       :current_shooter, :is_away, :game_id) 
        end
end