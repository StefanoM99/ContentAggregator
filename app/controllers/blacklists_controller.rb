class BlacklistsController < ApplicationController

    def new
        @blacklist = Blacklist.new
      end


def create
    @blacklist = Blacklist.create(
      name: params[:name],    
      spotify_url: params[:spotify_url],
     tipo: params[:tipo],
     title: params[:title],
     description: params[:description],
     summary: params[:summary]
    )
    @blacklist.save
  end

  def set_blacklist
    @blacklist = Blacklist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blacklist_params
    params.fetch(:blacklist, {})
  end