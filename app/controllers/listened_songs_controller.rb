class ListenedSongsController < ApplicationController
	before_action :set_user, only: [:index, :new]
  before_filter :authenticate_user! #, except: [:index, :show]
  
  # GET /listened_songs/new
  def new
		@listened_song = ListenedSong.new
		@artists = Artist.all
		@songs = Song.all
		if !params[:artist_id].nil? 
			@songs = Artist.find(params[:artist_id]).songs
		end
  end
  
  # GET /listened_songs
  def index
		@listened_songs = ListenedSong.where(user: @user)
  end

	# POST /listened_songs
	def create
		@listened_song = ListenedSong.new()
		@listened_song.song = Song.find(params[:song_id])
    @listened_song.user = current_user

    respond_to do |format|
      if @listened_song.save
        format.html { redirect_to listened_song_path, notice: 'Song was successfully added to played songs.' }        
      else
        format.html { render action: 'new' }        
      end
    end
	end
	
private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user#User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listened_song_params
      params.require(:listened_song).permit(:song_id)
    end
end
