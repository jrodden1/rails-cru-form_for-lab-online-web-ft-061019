class GenresController < ApplicationController
   def index
      @genres = Genre.all
   end
   
   def new
      @genre = Genre.new
   end
   
   def create
      @genre = Genre.create(genre_params)
      redirect_to genre_path(@genre)
   end

   def show 
      set_genre
   end
   
   def edit
      set_genre
   end
   
   def update
      set_genre
      @genre.update(genre_params)
      redirect_to genre_path(@genre)
   end
   
   private
      def genre_params
         params.require(:genre).permit(:name)        
      end

      def set_genre
         @genre = Genre.find_by_id(params[:id])
      end
   #end private methods
end
