class EdgesController < ApplicationController
  before_filter :require_user, :fetch_game

  def create
    @edge = @game.board_edges.build(params[:edge])
    @edge.user = @current_user
    if @edge.save
      redirect_to game_path(@game, :format => :json)
    else
      render :nothing => true, :status => :unprocessable_entity
    end
  end

  protected

  def fetch_game
    @game = Game.find(params[:game_id])
  end
end
