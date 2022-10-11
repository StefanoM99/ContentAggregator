class EditedPostsController < ApplicationController
  before_action :set_edited_post, only: %i[ show edit update destroy ]

  # GET /edited_posts or /edited_posts.json
  def index
    @edited_posts = EditedPost.all
  end

  # GET /edited_posts/1 or /edited_posts/1.json
  def show
  end

  # GET /edited_posts/new
  def new
    @edited_post = EditedPost.new
  end

  # GET /edited_posts/1/edit
  def edit
  end

  # POST /edited_posts or /edited_posts.json
  def create
    @edited_post = EditedPost.new(edited_post_params)

    respond_to do |format|
      if @edited_post.save
        format.html { redirect_to edited_post_url(@edited_post), notice: "Edited post was successfully created." }
        format.json { render :show, status: :created, location: @edited_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @edited_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edited_posts/1 or /edited_posts/1.json
  def update
    respond_to do |format|
      if @edited_post.update(edited_post_params)
        format.html { redirect_to edited_post_url(:user_id => @edited_post.user_id), notice: "Edited post was successfully updated." }
        format.json { render :show, status: :ok, location: @edited_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @edited_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edited_posts/1 or /edited_posts/1.json
  def destroy
    @edited_post.destroy

    respond_to do |format|
      format.html { redirect_to edited_posts_url(:user_id => @edited_post.user_id), notice: "Edited post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edited_post
      @edited_post = EditedPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def edited_post_params
      params.fetch(:edited_post, {})
    end
end
