ActionController::Routing::Routes.draw do |map|
  map.resource :user
  map.resource :user_session
  map.resources :messages
  map.resources :games do |games|
    games.resource :offer
    games.resource :offer_response
    games.resource :player
    games.resources :cards
    games.resources :dice_rolls
    games.resources :discards
    games.resources :edges
    games.resources :exchanges
    games.resources :nodes
    games.resources :robberies
  end
  map.root :controller => "games", :action => "index"
end
