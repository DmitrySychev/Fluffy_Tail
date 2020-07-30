class FavoritesController < ApplicationController

  #before_action only: [:show, :update, :edit, :destroy, :new]
  skip_before_action :authorized, only: [:index, :show, :update, :edit, :destroy, :new]


  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
    @pets = Pet.all
  end

  def create
    @current_user.favorites << Favorite.create(favorite_params)
    redirect_to user_path(@current_user)
  end

  def update
  end

  def delete
    @favorite.destroy
    redirect_to users_path
end

  private

  def favorite_params
    params.require(:favorite).permit(:pet_id)
  end



end
