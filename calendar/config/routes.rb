Rails.application.routes.draw do
  resources :events
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    resources :events
  end
  root 'events#list'
  get '/my_events', :action=>"list", :controller=>"events"
  get '/profile', :action=>"profile", :controller=>"users"
  get '/list_ajax', to: 'events#list_ajax', as: :list_ajax


end
