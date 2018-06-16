Rails.application.routes.draw do
  root to: 'page#home'
  get "/list" => "page#list"
  get "/show" => "page#show"
  post "/show" => "page#show"

  resources :places do
    collection do
      post :import
    end
  end
end
