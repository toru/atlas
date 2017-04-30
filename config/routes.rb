Rails.application.routes.draw do
  resources :categories

  resources :checkins do
    collection do
      get 'latest'
    end
  end

  resources :places
end
