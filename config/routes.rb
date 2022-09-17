Rails.application.routes.draw do
  
  scope '/feed' do
    resources :articles, :posts, :forecasts
  end

  scope '/profile' do
    resources :starred_articles, :reported_articles
    resources :my_posts, :edited_posts, :starred_posts, :reported_posts
  end

  devise_for :users

  get "/home", to: "home#index"
  root "home#index"

  get '/registration',to:"user#registration"
  
  get "/feed", to: "feeds#index"
  
  get "/articles", to: "articles#index"
  get "/posts", to: "posts#index"
  get "/forecasts", to: "forecasts#index"

  get "/profile", to: "profiles#index"
  
  get "/comments", to: "comments#index"

  get "/starred-articles", to: "starred_articles#index"
  get "/reported-articles", to: "reported_articles#index"

  get "/my-posts", to: "my_posts#index"
  get "/edited-posts", to: "edited_posts#index"
  get "/starred-posts", to: "starred_posts#index"
  get "/reported-posts", to: "reported_posts#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


