Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources 'users', only: %w[index show] do
    resources 'posts', only: %w[index new show]
  end
end
