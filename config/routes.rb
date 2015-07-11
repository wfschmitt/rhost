Rhost::Engine.routes.draw do
  resources :posts, :except => [:show]
  root :to => 'posts#index'
end
