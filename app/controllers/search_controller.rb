class SearchController < ApplicationController
  def search
    title = params[:title]

    if params[:genre_ids] != nil
    genres = params[:genre_ids]
     genre_id = ""
     genres.each do |genre|
      genre_id = genre_id + genre
     end
    end

    if params[:model_ids] != nil
    models = params[:model_ids]
     model_id = ""
     models.each do |model|
      model_id = model_id + model
     end
    end

    if params[:complete] != nil
    complete = params[:complete]
    end
    if params[:orbit] != nil
    orbit = params[:orbit]
    end
    if params[:multi_ending] != nil
    multi_ending = params[:multi_ending]
    end

    if params[:cero_ratings] != nil
    cero_ratings = params[:cero_ratings]
     rating = ""
     cero_ratings.each do |cero_rating|
      rating = rating + cero_rating
     end
    end

    @games = Game.where(status: true)
    @games = @games.where("title Like ?", "%#{params[:title]}%") if title.present?
    @games = @games.where(genre_id: genres) if genre_id.present?
    @games = @games.joins(:models).where(models: {id: models}) if model_id.present?
    @games = @games.where(complete: complete) if complete.present?
    @games = @games.where(orbit: orbit) if orbit.present?
    @games = @games.where(multi_ending: multi_ending) if multi_ending.present?
    @games = @games.where(cero_rating: cero_ratings) if rating.present?
    @games = @games.page(params[:page]).per(10).reverse_order

  end

  def search_page
  end
end
