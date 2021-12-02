class ArtistSongsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    #require "pry"; binding.pry
    @songs = @artist.songs
  end
end
