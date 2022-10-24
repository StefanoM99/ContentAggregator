class PlaylistCommentsController < ApplicationController
  before_action :set_playlist_comment, only: %i[ show edit update destroy ]

  # GET /playlist_comments or /playlist_comments.json
  def index
    @playlist_comments = PlaylistComment.all
  end

  # GET /playlist_comments/1 or /playlist_comments/1.json
  def show
  end

  # GET /playlist_comments/new
  def new
    @playlist_comment = PlaylistComment.new
  end

  # GET /playlist_comments/1/edit
  def edit
  end

  # POST /playlist_comments or /playlist_comments.json
  def create
    @playlist_comment = PlaylistComment.new(
      author: current_user.name + ' ' + current_user.surname,
      description: playlist_comment_params[:description],
      playlist_id: playlist_comment_params[:playlist_id],
      user_id: current_user.id
    )

    respond_to do |format|
      if @playlist_comment.save
        format.html { redirect_to playlist_path(@playlist_comment.playlist.id), notice: "Playlist comment was successfully created." }
        format.json { render :show, status: :created, location: @playlist_comment }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlist_comments/1 or /playlist_comments/1.json
  def update
    respond_to do |format|
      if @playlist_comment.update(playlist_comment_params)
        format.html { redirect_to playlist_comment_url(@playlist_comment), notice: "Playlist comment was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_comments/1 or /playlist_comments/1.json
  def destroy
    @playlist_comment.destroy

    respond_to do |format|
      format.html { redirect_to playlist_comments_url, notice: "Playlist comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist_comment
      @playlist_comment = PlaylistComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_comment_params
      params.require(:playlist_comment).permit(:author, :description, :user_id, :playlist_id)
    end
end
