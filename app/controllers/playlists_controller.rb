class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  # GET /playlists or /playlists.json
  def index
    require 'open-uri'
    require 'geocoder'
    require 'rspotify'

    remote_ip = URI.open('https://ident.me').read
    
    RSpotify::authenticate(Rails.application.credentials.dig(:spotify, :clientID), Rails.application.credentials.dig(:spotify, :clientSecret))
    
    if params[:country] == nil || params[:country] == ''
      featured_playlists = RSpotify::Playlist.browse_featured(country: Geocoder.search(remote_ip).first.country_code)
    else
      featured_playlists = RSpotify::Playlist.browse_featured(country: params[:country])
    end

    psize = featured_playlists.size-1
    
    for i in 0..psize do
      
      if Playlist.where(name: featured_playlists[i].name,
        spotify_url: featured_playlists[i].external_urls["spotify"],
        description: featured_playlists[i].description).empty? && Blacklist.where(name: featured_playlists[i].name,spotify_url: featured_playlists[i].external_urls["spotify"]).empty?
      Playlist.create(
        country: params[:country],
        name: featured_playlists[i].name,
        description: featured_playlists[i].description,
        spotify_url: featured_playlists[i].external_urls["spotify"],
        spotify_img: featured_playlists[i].images[0]["url"],
        tracks: featured_playlists[i].tracks.map{|t| [
          t.name,
          t.artists.map{|a| a.name},
          t.album.images[0]["url"],
          t.external_urls["spotify"],
          t.preview_url,
        ]}        
      )
      
    end
  end
  if params == nil
    @playlists = Playlist.all
  else
    @playlists = Playlist.where(country: params[:country])
  end
  end

  # GET /playlists/1 or /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :description, :spotify_url, :spotify_img)
    end
end
