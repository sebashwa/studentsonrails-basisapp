class SongsController < ApplicationController
  before_action :set_song_and_artist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
	
	
  # GET /artists/1/songs/new
  def new
    @song = Song.new
    @artist = Artist.find params[:artist_id]
  end

	# GET /artists/1/songs/1/edit
  def edit
  end

  # POST /artists/1/songs
  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find params[:artist_id]
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song.artist, notice: 'Song was successfully created.' }        
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /artists/1/songs/1
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /artists/1/songs/1
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to @artist }
    end
  end  
	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_song_and_artist
		@artist = Artist.find(params[:artist_id])
	  @song = Song.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def song_params
	  params.require(:song).permit(:title, :duration)
	end


end
