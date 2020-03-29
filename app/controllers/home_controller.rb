class HomeController < ApplicationController
  def top
    @genres = Genre.where(status: 'ture')

    @newgames = Game.where(status: true).reverse_order.limit(5) #新着5件取得

    day = Date.yesterday #今日
    mon = day << 1 #ひと月前からのデータ
    @rankgames = Game.select('games.*','count(favorites.id) AS favs') #gameテーブルの情報とfavoriteの数を取得
                  .left_joins(:favorites) #favoritesを右側(gamesが左側)のテーブルにして結合
                  .group('games.id') #game.idでグループ
                  .where(created_at: mon..day) #閲覧日から一ヶ月前までを集計
                  .order('favs desc') #favorite数の多い順に並べ替え
                  .limit(5) #5件まで
                  .where(status: true)
  end

  def ranking
    day = Date.today #今日
    mon = day << 1 #ひと月前からのデータ
    @games = Game.select('games.*','count(favorites.id) AS favs') #gameテーブルの情報とfavoriteの数を取得
                  .left_joins(:favorites) #favoritesを右側(gamesが左側)のテーブルにして結合
                  .group('games.id') #game.idでグループ
                  .where(created_at: mon..day) #閲覧日から一ヶ月前までを集計
                  .page(params[:page]).per(10) #ページネーション
                  .order('favs desc') #favorite数の多い順に並べ替え
                  .where(status: true)
  end

  def about
  end
end
