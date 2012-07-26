# coding: utf-8
class MyController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
   @companies = Company.where( user_id: session[:user_id] ).order( "created_at DESC" ).all
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
      redirect_to( { action: "show_player" }, notice: "プレイヤーの登録が完了しました。" )
    else
      render action: "new_player"
    end
  end

  #-------------#
  # show_player #
  #-------------#
  def show_player
    @player = Player.where( user_id: session[:user_id] ).includes( :user ).first
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
      redirect_to( { action: "show_player" }, notice: "プレイヤーの更新が完了しました。" )
    else
      render action: "edit_player"
    end
  end

  #-------------#
  # new_company #
  #-------------#
  def new_company
    @company = Company.new
    @company.content = File.read( "#{Rails.root}/app/views/my/company_template.txt", encoding: Encoding::UTF_8 )
  end

  #---------------#
  # entry_company #
  #---------------#
  def entry_company
    @company = Company.new( params[:company] )
    @company.user_id = session[:user_id]

    if @company.save
      redirect_to( { action: "show_company", id: @company.id }, notice: "カンパニーの登録が完了しました。" )
    else
      render action: "new_company"
    end
  end

  #--------------#
  # show_company #
  #--------------#
  def show_company
    @company = Company.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #--------------#
  # edit_company #
  #--------------#
  def edit_company
    @company = Company.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #----------------#
  # update_company #
  #----------------#
  def update_company
    @company = Company.where( id: params[:id], user_id: session[:user_id] ).first

    if @company.update_attributes( params[:company] )
      redirect_to( { action: "show_company", id: @company.id }, notice: "カンパニーの更新が完了しました。" )
    else
      render( action: "edit_company" )
    end
  end

end
