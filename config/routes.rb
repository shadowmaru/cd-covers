ActionController::Routing::Routes.draw do |map|
  map.resources :album_arts


  map.resources :users, :has_many => :album_arts
  map.resource  :session

  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
