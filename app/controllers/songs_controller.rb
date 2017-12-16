class SongsController < ApplicationController
    def index
      @songs = Song.order(total_adds: :desc)
      @user = current_user
    end
  
    def create
      @song = Song.new(song_params)
      if @song.valid?
        @song.save
        session[:song_id] = @song.id
        redirect_to :back
      else
        flash[:errors] = @song.errors
        redirect_to :back
      end
    end
  
    def show
      @song = Song.find(params[:id])
    end
  
    private
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
  