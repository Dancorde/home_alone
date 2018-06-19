class PageController < ApplicationController
  def home
  end

  def contact
  end

  def list
    @places = Place.page(params[:page]).per(12).all
  end

  def show
    if params[:endereco] != ""
      @results = Geocoder.search(params[:endereco])
      distancia = params[:distancia]
    else
      @results = Geocoder.search("São Carlos")
      distancia = 500
    end
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@results.first.coordinates[0]},#{@results.first.coordinates[1]}&radius=#{distancia}&type=#{params[:tipo]}&key=#{Rails.application.secrets.google_places_key}"
    uri = URI(url)
    http_call = Net::HTTP.get(uri)
    response = JSON.parse(http_call, {:symbolize_names => true})
    @locations = Kaminari.paginate_array(response[:results]).page(params[:page]).per(5)
    @hash = Gmaps4rails.build_markers(@locations) do |place, marker|
      marker.lat place[:geometry][:location][:lat]
      marker.lng place[:geometry][:location][:lng]
      marker.infowindow place[:name]
    end
  end

  private

    def search_params
      params.require(:data).permit(:address, :latitude, :longitude, :tipo, :distancia)
    end
end
