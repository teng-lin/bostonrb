BostonRuby::Application.routes.draw do
  %w{jobs projects users companies}.each do |dead_route|
    match "/#{dead_route}" => redirect('/')
  end

  root :to => 'high_voltage/pages#show', :id => 'home'
  get '/hackfests' => 'high_voltage/pages#show', :id => 'hackfests', :as => 'hackfests'
  get '/calendar' => 'high_voltage/pages#show', :id => 'calendar', :as => 'calendar'
  resources :proposals, :only => [:new, :create]
  get '/presentations/month/:month/' => 'presentations#index', :as => 'month_presentations'
  resources :presentations, :only => [:index, :show]
end
