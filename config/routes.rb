Rails.application.routes.draw do
  root to: 'page#home'
  get "/list" => "page#list"

  resources :places do
    collection do
      post :import
    end
  end
end
