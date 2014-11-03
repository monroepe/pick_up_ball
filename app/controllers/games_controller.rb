class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @games = current_user.games
  end

  def show
    @game = Game.find(params[:id])
    @players = @game.players.includes(:user)
    @comments = @game.comments.order("created_at")
  end

  def new
    @location = Location.find(params[:location_id])
    @game = Game.new
  end


  def create
    @location = Location.find(params[:location_id])
    @game = @location.games.build(game_params)
    @game.user = current_user

    if @game.save
      @game.players.create(user_id: current_user.id)
      redirect_to @location, notice: "Game created successfully!"
    else
      render "games/new"
    end
  end

  def edit
    @location = Location.find(params[:location_id])
    @game = @location.games.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @game = @location.games.find(params[:id])

      if @game.update(game_params)
        redirect_to @location, notice: "Game updated successfully!"
      else
        render "games/edit"
      end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @game = @location.games.find(params[:id])

    @game.destroy

    redirect_to location_path(@location), notice: "Game deleted successfully!"
  end

  private

  def game_params
    params.require(:game).permit(:name, :time, :date, :description)
  end

end

