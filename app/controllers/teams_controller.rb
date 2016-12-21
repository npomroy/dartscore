class TeamsController < ApplicationController
   def new
      @team = Team.new 
   end
   
   def create
      @team = Team.new( team_params )
      if @team.save
          flash[:success] = "Team created"
          redirect_to game_path(id: params[:game_id])
      else
          flash[:error] = "Team creation failed"
          render action: :new
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
   
   private
        def team_params
           params.require(:team).permit(:player1_id, :player2_id, :player3_id, :player4_id, :player5_id, :name, :score, :current_shooter, :is_away) 
        end
end