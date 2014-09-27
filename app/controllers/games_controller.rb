class GamesController < ApplicationController
before_action :authenticate_user!

def index
  @games = Game.all
end

def show
  @game = Game.find(params[:id])
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
    redirect_to @location, notice: "Game created successfully!"
  else
    render "game/new"
  end
end

def update
  @location = Location.find(params[:location_id])
  @game = @location.games.find(params[:id])
    if @game.update(game_params)
      redirect_to @location, notice: "Game updated successfully"
    else
      render "game/edit"
    end
end

def destroy

end

private
def game_params
  params.require(:game).permit(:game_name, :time, :date, :description)
end

end

