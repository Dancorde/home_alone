Rails.application.routes.draw do
  root to: 'page#home'

  resources :places do
    collection do
      post :import
    end
  end
end
