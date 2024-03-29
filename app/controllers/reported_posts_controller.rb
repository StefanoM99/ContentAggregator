class ReportedPostsController < ApplicationController
  before_action :set_reported_post, only: %i[ show edit update destroy ]

  # GET /reported_posts or /reported_posts.json
  def index
    @reported_posts = ReportedPost.all
    @user = User.find(params[:user_id])
    if current_user!=nil && @user.admin? && current_user.user?
      redirect_to feed_path
    else
      if !current_user  && @user.admin?
        redirect_to feed_path
      end
    end
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
    #puts(params[:post_file])
    @reported_post = ReportedPost.create(
      author: params[:author],
      title: params[:title],
      summary: params[:summary],
      post_file: ActiveStorage::Blob.find_by(key: params[:post_file]),
      user_id: current_user.id,
      post_id: params[:post_id]
    )

    
      if @reported_post.save

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reported_post.errors, status: :unprocessable_entity }
     
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
    if !SavedPost.where(post_id:@reported_post.post_id,type:"StarredPost").empty? && current_user.admin?
      @saved_post = SavedPost.where(post_id:@reported_post.post_id,type:"StarredPost")
      @saved_post.destroy_all
    
    end
    if !SavedPost.where(post_id:@reported_post.post_id,type:"EditedPost").empty? && current_user.admin?
      @edited_post = SavedPost.where(post_id:@reported_post.post_id,type:"EditedPost")
      @edited_post.destroy_all
    
    end

    if !SavedPost.where(post_id:@reported_post.post_id,type:"ReportedPost").empty? && current_user.admin?
      @reported_posts = SavedPost.where(post_id:@reported_post.post_id,type:"ReportedPost")
      @reported_posts.destroy_all
    
    end
    @reported_post.destroy
    respond_to do |format|
      if current_user.admin?
        @post = Post.find(@reported_post.post_id)
        
        @post.destroy
        format.html { redirect_to request.referrer }
        format.json { head :no_content }
    else 
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
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
