class SavedPlaylistsController < ApplicationController
  before_action :set_saved_playlist, only: %i[ show edit update destroy ]

  # GET /saved_playlists or /saved_playlists.json
  def index
    @saved_playlists = SavedPlaylist.all
  end

  # GET /saved_playlists/1 or /saved_playlists/1.json
  def show
  end

  # GET /saved_playlists/new
  def new
    @saved_playlist = SavedPlaylist.new
  end

  # GET /saved_playlists/1/edit
  def edit
  end

  # POST /saved_playlists or /saved_playlists.json
  def create
    @saved_playlist = SavedPlaylist.new(saved_playlist_params)

    respond_to do |format|
      if @saved_playlist.save
        format.html { redirect_to saved_playlist_url(@saved_playlist), notice: "Saved playlist was successfully created." }
        format.json { render :show, status: :created, location: @saved_playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saved_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_playlists/1 or /saved_playlists/1.json
  def update
    respond_to do |format|
      if @saved_playlist.update(saved_playlist_params)
        format.html { redirect_to saved_playlist_url(@saved_playlist), notice: "Saved playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @saved_playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saved_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_playlists/1 or /saved_playlists/1.json
  def destroy
    @saved_playlist.destroy

    respond_to do |format|
      format.html { redirect_to saved_playlists_url, notice: "Saved playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_playlist
      @saved_playlist = SavedPlaylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saved_playlist_params
      params.require(:saved_playlist).permit(:type, :name, :description, :spotify_url, :spotify_img)
    end
end
