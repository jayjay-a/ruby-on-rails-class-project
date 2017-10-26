class ChannelGroupsController < ApplicationController
  before_action :set_channel_group, only: [:show, :edit, :update, :destroy]

  # GET /channel_groups
  # GET /channel_groups.json
  def index
    @channel_groups = ChannelGroup.all
  end

  # GET /channel_groups/1
  # GET /channel_groups/1.json
  def show
  end

  # GET /channel_groups/new
  def new
    @channel_group = ChannelGroup.new
  end

  # GET /channel_groups/1/edit
  def edit
  end

  # POST /channel_groups
  # POST /channel_groups.json
  def create
    @channel_group = ChannelGroup.new(channel_group_params)

    respond_to do |format|
      if @channel_group.save
        format.html { redirect_to @channel_group, notice: 'Channel group was successfully created.' }
        format.json { render :show, status: :created, location: @channel_group }
      else
        format.html { render :new }
        format.json { render json: @channel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_groups/1
  # PATCH/PUT /channel_groups/1.json
  def update
    respond_to do |format|
      if @channel_group.update(channel_group_params)
        format.html { redirect_to @channel_group, notice: 'Channel group was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel_group }
      else
        format.html { render :edit }
        format.json { render json: @channel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_groups/1
  # DELETE /channel_groups/1.json
  def destroy
    @channel_group.destroy
    respond_to do |format|
      format.html { redirect_to channel_groups_url, notice: 'Channel group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_group
      @channel_group = ChannelGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_group_params
      params.require(:channel_group).permit(:group_id, :channel_id, :date)
    end
end
