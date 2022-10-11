class ReportedPostsController < ApplicationController
  before_action :set_reported_post, only: %i[ show edit update destroy ]

  # GET /reported_posts or /reported_posts.json
  def index
    @reported_posts = ReportedPost.all
  end

  # GET /reported_posts/1 or /reported_posts/1.json
  def show
  end

  # GET /reported_posts/new
  def new
    @reported_post = ReportedPost.new
  end

  # GET /reported_posts/1/edit
  def edit
  end

  # POST /reported_posts or /reported_posts.json
  def create
    @reported_post = ReportedPost.create(
      author: params[:author],
      title: params[:title],
      summary: params[:summary],
      image: params[:image],
      video: params[:video],
      user_id: current_user.id,
      post_id: params[:post_id]
    )

    respond_to do |format|
      if @reported_post.save
        format.html { redirect_to reported_post_url(@reported_post), notice: "Reported post was successfully created." }
        format.json { render :show, status: :created, location: @reported_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reported_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reported_posts/1 or /reported_posts/1.json
  def update
    respond_to do |format|
      if @reported_post.update(reported_post_params)
        format.html { redirect_to reported_post_url(:user_id => @reported_post.user_id), notice: "Reported post was successfully updated." }
        format.json { render :show, status: :ok, location: @reported_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reported_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reported_posts/1 or /reported_posts/1.json
  def destroy
    @reported_post.destroy

    respond_to do |format|
      format.html { redirect_to reported_posts_url(:user_id => @reported_post.user_id), notice: "Reported post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reported_post
      @reported_post = ReportedPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reported_post_params
      params.fetch(:reported_post, {})
    end
end
