ActionController::Routing::Routes.draw do |map|

  map.resources :album_arts, :collection => { :search => :get }

  map.resources :users, :has_many => :album_arts
  map.resource  :sessions

  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.connect '', :controller => 'album_arts'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end