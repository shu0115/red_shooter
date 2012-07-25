# coding: utf-8
class JobsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @jobs = Job.where( user_id: session[:user_id] ).all
  end

  #------#
  # show #
  #------#
  def show
    @job = Job.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #-----#
  # new #
  #-----#
  def new
    @job = Job.new
  end

  #------#
  # edit #
  #------#
  def edit
    @job = Job.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #--------#
  # create #
  #--------#
  def create
    @job = Job.new( params[:job] )
    @job.user_id = session[:user_id]

    if @job.save
      redirect_to( { action: "index" }, notice: "Job was successfully created." )
    else
      render action: "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @job = Job.where( id: params[:id], user_id: session[:user_id] ).first

    if @job.update_attributes( params[:job] )
      redirect_to( { action: "show", id: params[:id] }, notice: "Job was successfully updated." )
    else
      render action: "edit", id: params[:id]
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @job = Job.where( id: params[:id], user_id: session[:user_id] ).first
    @job.destroy

    redirect_to action: "index"
  end

end
