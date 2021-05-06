Rails.application.routes.draw do
  namespace :mc_mt do
    resources :host_metric_time_ranges
    resources :host_metric_results
    resources :hosts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'mc_mt/hosts#index', as: 'home'
end
