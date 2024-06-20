class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  def show
    @album_details = @album.album_details
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end
end
