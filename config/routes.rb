Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index new create show] do
      resources 'comments', only: %w[create]
      resources 'likes', only: %w[create]
    end
  end
end
