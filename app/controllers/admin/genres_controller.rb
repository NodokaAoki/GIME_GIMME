class Admin::GenresController < AdminController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params_genre)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(params_genre)
    @genre.save
    redirect_to admin_genres_path
  end

  private
    def params_genre
      params.require(:genre).permit(:name, :status)
    end

end
