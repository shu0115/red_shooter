# coding: utf-8
class MyController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
  end

  #------------#
  # new_player #
  #------------#
  def new_player
    @player = Player.new
  end

  #--------------#
  # entry_player #
  #--------------#
  def entry_player
    @player = Player.new( params[:player] )
    @player.user_id = session[:user_id]

    if @player.save
      redirect_to( { action: "index" }, notice: "プレイヤー登録が完了しました。" )
    else
      render action: "new_player"
    end
  end

  #-------------#
  # edit_player #
  #-------------#
  def edit_player
    @player = Player.where( user_id: session[:user_id] ).first
  end

  #---------------#
  # update_player #
  #---------------#
  def update_player
    @player = Player.where( user_id: session[:user_id] ).first

    if @player.update_attributes( params[:player] )
      redirect_to( { action: "index" }, notice: "プレイヤーの更新が完了しました。" )
    else
      render action: "edit_player"
    end
  end

  #-----------------#
  # new_corporation #
  #-----------------#
  def new_corporation
    @corporation = Corporation.new
  end

  #-------------------#
  # entry_corporation #
  #-------------------#
  def entry_corporation
    @corporation = Corporation.new( params[:corporation] )
    @corporation.user_id = session[:user_id]

    if @corporation.save
      redirect_to( { action: "index" }, notice: "コーポレーション登録が完了しました。" )
    else
      render action: "new_corporation"
    end
  end

  #------------------#
  # edit_corporation #
  #------------------#
  def edit_corporation
    @corporation = Corporation.where( user_id: session[:user_id] ).first
  end

  #--------------------#
  # update_corporation #
  #--------------------#
  def update_corporation
    @corporation = Corporation.where( user_id: session[:user_id] ).first

    if @corporation.update_attributes( params[:corporation] )
      redirect_to( { action: "index" }, notice: "コーポレーションの更新が完了しました。" )
    else
      render action: "edit_corporation"
    end
  end

end
