class Admin::GenresController < AdminController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params_genre)
    @genre.save
    @genres = Genre.all
    redirect_to admin_genre_path(@genre.id)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(params_genre)
    @genre.save
    redirect_to admin_genre_path(@genre.id)
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
    def params_genre
      params.require(:genre).permit(:name, :status)
    end

end