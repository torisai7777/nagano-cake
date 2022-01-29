class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if  @genre.save
      redirect_to admin_genres_path
    else
      flash[:genre_created_error] = "ジャンル名を入力してください。"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      # Model:Genres.rb after_update => 無効にしたら関連商品の販売ステータスを販売不可に変更
      redirect_to admin_genres_path
    else
      flash[:genre_updated_error] = "ジャンル名を入力してください"
      render :edit
    end
  end

 


  private
  def genre_params
     params.require(:genre).permit(:name)
  end

end
