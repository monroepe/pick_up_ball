class WelcomeController < ApplicationController
  def index
    @games = Game.includes(:location).last(10).reverse
  end
end
