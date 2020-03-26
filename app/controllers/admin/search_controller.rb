class Admin::SearchController < AdminController
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

    if title.present? #タイトル有
      @games = Game.where("title Like ?", "%#{params[:title]}%")
      if genre_id.present? #タイトル有、ジャンル有
        @games = Game.where("title Like ?", "%#{params[:title]}%")
                      .where(genre_id: genres)
        if model_id.present? #タイトル有、ジャンル有、対応機種有
          @games = Game.joins(:models)
                        .where("title Like ?", "%#{params[:title]}%")
                        .where(genre_id: genres)
                        .where(models: {id: models})
          if complete.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有
            @games = Game.joins(:models)
                          .where("title Like ?", "%#{params[:title]}%")
                          .where(genre_id: genres)
                          .where(models: {id: models})
                          .where(complete: complete)
            if orbit.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素有
              @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(genre_id: genres)
                            .where(models: {id: models})
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル有、ジャンル有、対応機種有、コンプリート要素無
            if orbit.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素有
              @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(genre_id: genres)
                            .where(models: {id: models})
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        else #タイトル有、ジャンル有、対応機種無
          if complete.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有
            @games = Game.where("title Like ?", "%#{params[:title]}%")
                          .where(genre_id: genres)
                          .where(complete: complete)
            if orbit.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素有
              @games = Game.where("title Like ?", "%#{params[:title]}%")
                            .where(genre_id: genres)
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル有、ジャンル有、対応機種無、コンプリート要素無
            if orbit.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素有
              @games = Game.where("title Like ?", "%#{params[:title]}%")
                            .where(genre_id: genres)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(genre_id: genres)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(genre_id: genres)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        end
      else #タイトル有、ジャンル無
        if model_id.present? #タイトル有、ジャンル無、対応機種有
          @games = Game.joins(:models)
                        .where("title Like ?", "%#{params[:title]}%")
                        .where(models: {id: models})
          if conplete.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有
            @games = Game.joins(:models)
                          .where("title Like ?", "%#{params[:title]}%")
                          .where(models: {id: models})
                          .where(complete: complete)
            if orbit.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素有
              @games = Game.joins(:models)
                          .where("title Like ?", "%#{params[:title]}%")
                          .where(models: {id: models})
                          .where(complete: complete)
                          .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(models: {id: models})
                            .where(complete: complete)
                            .where(orbit: orbit)
                            .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                              .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(models: {id: models})
                            .where(complete: complete)
                            .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                              .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル有、ジャンル無、対応機種有、コンプリート要素無
            if orbit.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素有
              @games = Game.joins(:models)
                          .where("title Like ?", "%#{params[:title]}%")
                          .where(models: {id: models})
                          .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(models: {id: models})
                            .where(orbit: orbit)
                            .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                              .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(orbit: orbit)
                              .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                            .where("title Like ?", "%#{params[:title]}%")
                            .where(models: {id: models})
                            .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(multi_ending: multi_ending)
                              .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                              .where("title Like ?", "%#{params[:title]}%")
                              .where(models: {id: models})
                              .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        else #タイトル有、ジャンル無、対応機種無
          if complete.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有
            @games = Game.where("title Like ?", "%#{params[:title]}%")
                          .where(complete: complete)
            if orbit.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素有
              @games = Game.where("title Like ?", "%#{params[:title]}%")
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル有、ジャンル無、対応機種無、コンプリート要素無
            if orbit.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素有
              @games = Game.where("title Like ?", "%#{params[:title]}%")
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.where("title Like ?", "%#{params[:title]}%")
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル有、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.where("title Like ?", "%#{params[:title]}%")
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        end
      end
    else #タイトル無
      @games = Game.all
      if genre_id.present? #タイトル無、ジャンル有
        @games = Game.where(genre_id: genres)
        if model_id.present? #タイトル無、ジャンル有、対応機種有
          @games = Game.joins(:models)
                        .where(genre_id: genres)
                        .where(models: {id: models})
          if complete.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有
            @games = Game.joins(:models)
                          .where(genre_id: genres)
                          .where(models: {id: models})
                          .where(complete: complete)
            if orbit.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素有
              @games = Game.joins(:models)
                            .where(genre_id: genres)
                            .where(models: {id: models})
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル無、ジャンル有、対応機種有、コンプリート要素無
            if orbit.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素有
              @games = Game.joins(:models)
                            .where(genre_id: genres)
                            .where(models: {id: models})
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where(genre_id: genres)
                              .where(models: {id: models})
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種有、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(genre_id: genres)
                                .where(models: {id: models})
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        else #タイトル無、ジャンル有、対応機種無
          if complete.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有
            @games = Game.where(genre_id: genres)
                          .where(complete: complete)
            if orbit.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素有
              @games = Game.where(genre_id: genres)
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.where(genre_id: genres)
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.where(genre_id: genres)
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル無、ジャンル有、対応機種無、コンプリート要素無
            if orbit.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素有
              @games = Game.where(genre_id: genres)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.where(genre_id: genres)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.where(genre_id: genres)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル有、対応機種無、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.where(genre_id: genres)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        end
      else #タイトル無、ジャンル無
        if model_id.present? #タイトル無、ジャンル無、対応機種有
          @games = Game.joins(:models)
                        .where(models: {id: models})
          if complete.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有
            @games = Game.joins(:models)
                          .where(models: {id: models})
                          .where(complete: complete)
            if orbit.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素有
              @games = Game.joins(:models)
                            .where(models: {id: models})
                            .where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where(models: {id: models})
                              .where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル無、ジャンル無、対応機種有、コンプリート要素無
            if orbit.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素有
              @games = Game.joins(:models)
                            .where(models: {id: models})
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.joins(:models)
                              .where(models: {id: models})
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.joins(:models)
                              .where(models: {id: models})
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種有、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.joins(:models)
                                .where(models: {id: models})
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          end
        else #タイトル無、ジャンル無、対応機種無
          if complete.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有
            @games = Game.where(complete: complete)
            if orbit.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素有
              @games = Game.where(complete: complete)
                            .where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド有
                @games = Game.where(complete: complete)
                              .where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド有、CERO有
                  @games = Game.where(complete: complete)
                                .where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素有、マルチエンド無、CERO有
                  @games = Game.where(complete: complete)
                                .where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素無
              if multi_ending.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド有
                @games = Game.where(complete: complete)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド有、CERO有
                  @games = Game.where(complete: complete)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素有、周回要素無、マルチエンド無、CERO有
                  @games = Game.where(complete: complete)
                                .where(cero_rating: cero_ratings)
                end
              end
            end
          else #タイトル無、ジャンル無、対応機種無、コンプリート要素無
            if orbit.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素有
              @games = Game.where(orbit: orbit)
              if multi_ending.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド有
                @games = Game.where(orbit: orbit)
                              .where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド有、CERO有
                  @games = Game.where(orbit: orbit)
                                .where(multi_ending: multi_ending)
                                .where(cero_rating: cero_ratings)
                end
              else #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素有、マルチエンド無、CERO有
                  @games = Game.where(orbit: orbit)
                                .where(cero_rating: cero_ratings)
                end
              end
            else #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素無
              if multi_ending.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド有
                @games = Game.where(multi_ending: multi_ending)
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド有、CERO有
                  @games = Game.where(multi_ending: multi_ending)
                end
              else #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド無
                if rating.present? #タイトル無、ジャンル無、対応機種無、コンプリート要素無、周回要素無、マルチエンド無、CERO有
                  @games = Game.where(cero_rating: cero_ratings)
                end
              end
            end
          end
        end
      end
    end
  @games = @games.page(params[:page]).per(10).reverse_order
  end


  def search_page
  end

end
