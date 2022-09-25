class SavedPostsController < ApplicationController
  before_action :set_saved_post, only: %i[ show edit update destroy ]

  # GET /saved_posts or /saved_posts.json
  def index
    @saved_posts = SavedPost.all
  end

  # GET /saved_posts/1 or /saved_posts/1.json
  def show
  end

  # GET /saved_posts/new
  def new
    @saved_post = SavedPost.new
  end

  # GET /saved_posts/1/edit
  def edit
  end

  # POST /saved_posts or /saved_posts.json
  def create
    @saved_post = SavedPost.new(saved_post_params)

    respond_to do |format|
      if @saved_post.save
        format.html { redirect_to saved_post_url(@saved_post), notice: "Saved post was successfully created." }
        format.json { render :show, status: :created, location: @saved_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saved_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_posts/1 or /saved_posts/1.json
  def update
    respond_to do |format|
      if @saved_post.update(saved_post_params)
        format.html { redirect_to saved_post_url(@saved_post), notice: "Saved post was successfully updated." }
        format.json { render :show, status: :ok, location: @saved_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saved_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_posts/1 or /saved_posts/1.json
  def destroy
    @saved_post.destroy

    respond_to do |format|
      format.html { redirect_to saved_posts_url, notice: "Saved post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_post
      @saved_post = SavedPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saved_post_params
      params.require(:saved_post).permit(:type, :author, :title, :summary, :image, :video)
    end
end
