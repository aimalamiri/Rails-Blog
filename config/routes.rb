Rails.application.routes.draw do
  # devise_scope :user do
  #   get "users", to: "devise/sessions#new"
  # end
  devise_for :users

  # Defines the root path route ("/")
  # root "articles#index"
  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index new create show] do
      resources 'comments', only: %w[create]
      resources 'likes', only: %w[create]
    end
  end
end
