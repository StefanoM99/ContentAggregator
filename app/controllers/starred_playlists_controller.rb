class StarredPlaylistsController < ApplicationController
  before_action :set_starred_playlist, only: %i[ show edit update destroy ]

  # GET /starred_playlists or /starred_playlists.json
  def index
    @starred_playlists = StarredPlaylist.all
  end

  # GET /starred_playlists/1 or /starred_playlists/1.json
  def show
  end

  # GET /starred_playlists/new
  def new
    @starred_playlist = StarredPlaylist.new
  end

  # GET /starred_playlists/1/edit
  def edit
  end

  # POST /starred_playlists or /starred_playlists.json
  def create
    @starred_playlist = StarredPlaylist.create(
      country: params[:country],
      name: params[:name],
      description: params[:description],
      spotify_url: params[:spotify_url],
      spotify_img: params[:spotify_img],
      playlist_id: params[:playlist_id],
      user: current_user
     
    )

    respond_to do |format|
      if @starred_playlist.save
        format.html { redirect_to starred_playlist_url(@starred_playlist), notice: "Starred playlist was successfully created." }
        format.json { render :show, status: :created, location: @starred_playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @starred_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starred_playlists/1 or /starred_playlists/1.json
  def update
    respond_to do |format|
      if @starred_playlist.update(starred_playlist_params)
        format.html { redirect_to starred_playlist_url(@starred_playlist), notice: "Starred playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @starred_playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @starred_playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starred_playlists/1 or /starred_playlists/1.json
  def destroy
    @starred_playlist.destroy

    respond_to do |format|
      format.html { redirect_to starred_playlists_url, notice: "Starred playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starred_playlist
      @starred_playlist = StarredPlaylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starred_playlist_params
      params.fetch(:starred_playlist, {})
    end
end