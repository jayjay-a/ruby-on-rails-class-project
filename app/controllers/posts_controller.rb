class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #uses cancan here
  #under each method you can use cancan to restrict shit using following the syntax:
  #!authorize! :action, accessto
  # you can check/change these permissions in the ability.rb

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else if params[:board_id]
      @posts = Post.where(board_id: params[:board_id]).order("created_at DESC")
    else
      @posts = Post.order("created_at DESC")
         end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    authorize! :create, @post
    @post = Post.new(post_params)
    @post.user_id = current_user.id #this to make posts be posted by the current user
    @post.created_at = Time.now # this to make post at current time
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, flash: { success: 'Post was successfully created.' }}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize! :update, @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, flash: { info: 'Post was successfully updated.' }}
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { reboardnder json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize! :destroy, @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, flash: { warning: 'Post was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :date, :board_id, :message, :user_id)
    end
end
