class StarredPostsController < ApplicationController
  before_action :set_starred_post, only: %i[ show edit update destroy ]

  # GET /starred_posts or /starred_posts.json
  def index
    @starred_posts = StarredPost.all
  end

  # GET /starred_posts/1 or /starred_posts/1.json
  def show
  end

  # GET /starred_posts/new
  def new
    @starred_post = StarredPost.new
  end

  # GET /starred_posts/1/edit
  def edit
  end

  # POST /starred_posts or /starred_posts.json
  def create
    @starred_post = StarredPost.create(
      author: params[:author],
      title: params[:title],
      summary: params[:summary],
      user_id: current_user.id,
      post_id: params[:post_id]
    )

    respond_to do |format|
      if @starred_post.save
        format.html { redirect_to starred_post_url(@starred_post), notice: "Starred post was successfully created." }
        format.json { render :show, status: :created, location: @starred_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @starred_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starred_posts/1 or /starred_posts/1.json
  def update
    respond_to do |format|
      if @starred_post.update(starred_post_params)
        format.html { redirect_to starred_post_url(:user_id => @starred_post.user_id), notice: "Starred post was successfully updated." }
        format.json { render :show, status: :ok, location: @starred_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @starred_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starred_posts/1 or /starred_posts/1.json
  def destroy
    @starred_post.destroy

    respond_to do |format|
      format.html { redirect_to starred_posts_url(:user_id => @starred_post.user_id), notice: "Starred post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starred_post
      @starred_post = StarredPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starred_post_params
      params.fetch(:starred_post, {}).permit(:post_id)
    end
end
