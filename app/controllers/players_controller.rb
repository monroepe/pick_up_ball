class PlayersController < ApplicationController
before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @player = Player.new
  end

  def create
    @game = Game.find(params[:game_id])
    @player = @game.players.build(user_id: current_user.id)

    if @player.save
      redirect_to location_game_path(@game.location, @game), notice: "Joined game"
    else
      redirect_to location_game_path(@game.location, @game), notice: "Failed to join game"
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @player = current_user.games.where(game_id: params[:game_id])

    @player.destroy

    redirect_to location_game_path(@game.location, @game), notice: "Court destroyed successfully!"
  end

end