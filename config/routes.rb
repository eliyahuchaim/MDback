Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :articles, :posts, :reactions, :cards

      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/article/reactions/:id', to: 'articles#article_reactions'

    end
  end
end
