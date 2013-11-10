class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @artist = Artist.find params[:artist_id]
  end

  def show
  end

  def update
  	@artist = Artist.find(params[:artist_id])
	@album = Album.find(params[:id])
	if @album.update(album_params)
    	redirect_to @artist, notice: 'Artist was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def edit
  	@album = Album.find params[:id]
  end

  def destroy
  	@album = Album.find params[:id]
  	@album.destroy
  	redirect_to artist_path(params[:artist_id])
  end

  def create
   @album = Album.new(album_params)
    @album.artist = Artist.find params[:artist_id]
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album.artist, notice: 'Album was successfully created.' }        
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def album_params
	  params.require(:album).permit(:title, :year)
	end
end
