class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #uses cancan here
  #under each method you can use cancan to restrict shit using following the syntax:
  #!authorize! :action, accessto
  # you can check/change these permissions in the ability.rb

  # GET /channels
  # GET /channels.json
  def index
      @channels = Channel.all
      if params[:search]
        @channels = Channel.search(params[:search]).order("created_at DESC")
      else
        @channels = Channel.all.order("created_at DESC")
      end
    end

  # GET /channels/1
  # GET /channels/1.json
  def show
    authorize! :manage, @channel
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end
  # POST /channels
  # POST /channels.json
  def create
    authorize! :create, @channel
    @channel = Channel.new(channel_params)
    @channel.created_at = Time.now #set time as sysdate. but idk if we even gon use this
    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, flash: { success: 'Channel was successfully created.' }}
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    authorize! :update, @channel
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, flash: { success: 'Channel was successfully updated.' }}
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    authorize! :destroy, @channel
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, flash: { warning: 'Channel was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name, :date)
    end
end
