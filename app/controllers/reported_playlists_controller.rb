class ReportedPlaylistsController < ApplicationController
  before_action :set_reported_playlist, only: %i[ show edit update destroy ]

  # GET /reported_playlists or /reported_playlists.json
  def index
    @reported_playlists = ReportedPlaylist.all
  end

  # GET /reported_playlists/1 or /reported_playlists/1.json
  def show
  end

  # GET /reported_playlists/new
  def new
    @reported_playlist = ReportedPlaylist.new
  end

  # GET /reported_playlists/1/edit
  def edit
  end

  # POST /reported_playlists or /reported_playlists.json
  def create
    @reported_playlist = ReportedPlaylist.create(
      country: params[:coutry],
      name: params[:name],
      description: params[:description],
      spotify_url: params[:spotify_url],
      spotify_img: params[:spotify_img],
      user_id: current_user.id,
      playlist_id: params[:playlist_id]
    )

    respond_to do |format|
      if @reported_playlist.save
        format.html { redirect_to reported_playlist_url(@reported_playlist), notice: "Reported playlist was successfully created." }
        format.json { render :show, status: :created, location: @reported_playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reported_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reported_playlists/1 or /reported_playlists/1.json
  def update
    respond_to do |format|
      if @reported_playlist.update(reported_playlist_params)
        format.html { redirect_to reported_playlist_url(:user_id => @reported_playlist.user_id), notice: "Reported playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @reported_playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reported_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reported_playlists/1 or /reported_playlists/1.json
  def destroy
    @reported_playlist.destroy

    respond_to do |format|
      format.html { redirect_to reported_playlists_url(:user_id => @reported_playlist.user_id), notice: "Reported playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reported_playlist
      @reported_playlist = ReportedPlaylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reported_playlist_params
      params.fetch(:reported_playlist, {}).permit(:playlist_id,:user_id)
    end
end
