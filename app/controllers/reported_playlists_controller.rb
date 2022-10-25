class ReportedPlaylistsController < ApplicationController
  before_action :set_reported_playlist, only: %i[ show edit update destroy ]

  # GET /reported_playlists or /reported_playlists.json
  def index
    @user = User.find(params[:user_id])
    if current_user!=nil && @user.admin? && current_user.user?
      redirect_to feed_path
    else
      if !current_user  && @user.admin?
        redirect_to feed_path
      end
    end
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
      country: params[:country],
      name: params[:name],
      description: params[:description],
      spotify_url: params[:spotify_url],
      spotify_img: params[:spotify_img],
      user_id: current_user.id,
      playlist_id: params[:playlist_id]
    )

    
      if @reported_playlist.save
     
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reported_playlist.errors, status: :unprocessable_entity }
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
    if !SavedPlaylist.where(playlist_id:@reported_playlist.playlist_id,type:"StarredPlaylist").empty? && current_user.admin?
      @saved_playlist = SavedPlaylist.where(playlist_id:@reported_playlist.playlist_id,type:"StarredPlaylist")
      @saved_playlist.destroy_all
     
    end

    if !SavedPlaylist.where(playlist_id:@reported_playlist.playlist_id,type:"ReportedPlaylist").empty? && current_user.admin?
      @reported_playlists = SavedPlaylist.where(playlist_id:@reported_playlist.playlist_id,type:"ReportedPlaylist")
      @reported_playlists.destroy_all
     
    end

    @reported_playlist.destroy
    respond_to do |format|
    if current_user.admin?
      @playlist = Playlist.find(@reported_playlist.playlist_id)
      
      @blacklist = Blacklist.create(
        name: @reported_playlist.name,    
        spotify_url: @reported_playlist.spotify_url,
        tipo: "Playlist"
      )
      
      @playlist.destroy
      format.html { redirect_to current_user, notice: "Reported Playlist was successfully destroyed." }
      format.json { head :no_content }
  else 
    
      format.html { redirect_to reported_playlists_url(:user_id => @reported_playlist.user_id), notice: "Reported playlist was successfully destroyed." }
      format.json { head :no_content }
    end
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
