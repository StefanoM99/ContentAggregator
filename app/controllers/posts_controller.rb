class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  require "uri"

  # GET /posts or /posts.json
  def index
    @posts = Post.all.reverse()
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
  
    #puts URI.extract(post_params[:summary])
    @post = Post.new(
      user_id: current_user.id,
      author: current_user.name + ' ' + current_user.surname,
      title: post_params[:title],
      summary: post_params[:summary], 
      post_file: post_params[:post_file]
    )

    respond_to do |format|

      safe = true
      URI.extract(post_params[:summary]).each do |u|
        if not SafeBrowsing.is_it_safe?(u)
          safe = false
        end
      end

      if post_params[:title].present?
        if (
          post_params[:post_file].nil? || 
          post_params[:post_file].content_type == "image/png" ||
          post_params[:post_file].content_type == "image/jpeg" ||
          post_params[:post_file].content_type == "video/mp4"
        )
          if safe and @post.save
            @my_post = MyPost.create(user_id: current_user.id,
              author: current_user.name + ' ' + current_user.surname,
              title: post_params[:title],
              summary: post_params[:summary],
              post_file: post_params[:post_file],
              post_id: post_params[:id]
            )

            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
          else
            if not safe
              format.html { redirect_to new_post_path(@post.id), alert: "Il post contiene un link pericoloso." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to new_post_path(@post.id), alert: "Post non valido. File supportati: jpeg, png, mp4" }
        end
      else
        format.html { redirect_to new_post_path(@post.id), alert: "Post non valido. Deve essere presente un titolo." }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
    respond_to do |format|

      safe = true
      URI.extract(post_params[:summary]).each do |u|
        if not SafeBrowsing.is_it_safe?(u)
          safe = false
        end
      end

      if safe and @post.update(post_params)
        @edited_post = EditedPost.create(user_id: current_user.id,
          author: current_user.name + ' ' + current_user.surname,
          title: post_params[:title],
          summary: post_params[:summary],
          post_file: post_params[:post_file],
          post_id: params[:id]
        )

        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        if not safe
          format.html { redirect_to edit_post_path, alert: "Il post contiene un link pericoloso." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(:author, :title, :summary, :post_file, :id)
    end
end
