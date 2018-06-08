json.extract! place, :id, :rua, :bairro, :cidade, :numero, :latitude, :longitude, :descricao, :created_at, :updated_at
json.url place_url(place, format: :json)
