class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  #under each method you can use cancan to restrict shit using following the syntax:
  #!authorize! :action, accessto
  # you can check/change these permissions in the ability.rb

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    if params[:search]
      @boards = Board.search(params[:search]).order("created_at DESC")
    else if params[:channel_id]
           @boards = Board.where(channel_id: params[:channel_id]).order("created_at DESC")
         else
           @boards = Board.order("created_at DESC")
         end
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    authorize! :create, @board
    @board = Board.new(board_params)
    #this to make board be posted by current user
    @board.user_id = current_user.id
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    authorize! :update, @board
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    authorize! :destroy, @board
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :date, :channel_id, :user_id,)
    end

end