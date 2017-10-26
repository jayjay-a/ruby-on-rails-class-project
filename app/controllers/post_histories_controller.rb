class PostHistoriesController < ApplicationController
  before_action :set_post_history, only: [:show, :edit, :update, :destroy]

  # GET /post_histories
  # GET /post_histories.json
  def index
    @post_histories = PostHistory.all
  end

  # GET /post_histories/1
  # GET /post_histories/1.json
  def show
  end

  # GET /post_histories/new
  def new
    @post_history = PostHistory.new
  end

  # GET /post_histories/1/edit
  def edit
  end

  # POST /post_histories
  # POST /post_histories.json
  def create
    @post_history = PostHistory.new(post_history_params)

    respond_to do |format|
      if @post_history.save
        format.html { redirect_to @post_history, notice: 'Post history was successfully created.' }
        format.json { render :show, status: :created, location: @post_history }
      else
        format.html { render :new }
        format.json { render json: @post_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_histories/1
  # PATCH/PUT /post_histories/1.json
  def update
    respond_to do |format|
      if @post_history.update(post_history_params)
        format.html { redirect_to @post_history, notice: 'Post history was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_history }
      else
        format.html { render :edit }
        format.json { render json: @post_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_histories/1
  # DELETE /post_histories/1.json
  def destroy
    @post_history.destroy
    respond_to do |format|
      format.html { redirect_to post_histories_url, notice: 'Post history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_history
      @post_history = PostHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_history_params
      params.require(:post_history).permit(:action, :date, :user_id, :post_id)
    end
end
