class SongsController < ApplicationController
   def index
      @songs = Song.all
   end
   
   def new
      @song = Song.new
   end
   
   def create
      @song = Song.create(song_params)
      redirect_to song_path(@song)
   end

   def show 
      set_song
      @genre = Genre.find_by_id(@song.genre_id)
      @artist = Artist.find_by_id(@song.artist_id)
   end
   
   def edit
      set_song
   end
   
   def update
      set_song
      @song.update(song_params)
      redirect_to song_path(@song)
   end
   
   private
      def song_params
         params.require(:song).permit(:name, :artist_id, :genre_id)        
      end

      def set_song
         @song = Song.find_by_id(params[:id])
      end
   #end private methods
end
