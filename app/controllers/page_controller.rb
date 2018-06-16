class PageController < ApplicationController
  def home
  end

  def list
    @places = Place.page(params[:page]).per(12).all
  end

  def show
  
  end

  private

    def search_params
      params.require(:data).permit(:address, :latitude, :longitude, :tipo, :distancia)
    end
end
