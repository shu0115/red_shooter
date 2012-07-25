# coding: utf-8
class PlayersController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @players = Player.includes( :user ).order( "created_at DESC" ).all
  end

  #------#
  # show #
  #------#
  def show
    @player = Player.where( id: params[:id] ).includes( :user ).first
  end

end
