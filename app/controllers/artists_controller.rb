class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
	  
  # GET /artists  
  def index
    @artists = Artist.all
  end
  
  # GET /artists/1
  def show
    @songs = @artist.songs
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

# GET /artists/1/edit
  def edit
  end

  # POST /artists  
  def create
    @artist = Artist.new(artist_params)
    

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }        
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /artists/1
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
    end
  end  
	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_artist
	  @artist = Artist.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def artist_params
	  params.require(:artist).permit(:name)
	end

end
