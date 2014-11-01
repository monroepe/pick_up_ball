class WelcomeController < ApplicationController
  def index
    @games = Game.all.includes(:location)
  end
end
