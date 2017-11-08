class GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :edit, :destroy]

    def index
        @games = Game.all
    end

    def show
        @listings = Listing.all.order("created_at DESC")
    end

    private

    def set_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:cover_image_data, :name, :description)
    end
end