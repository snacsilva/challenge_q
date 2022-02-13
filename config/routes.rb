Rails.application.routes.draw do
  resources :enterprises do
    resources :employees
    resources :leaders do
      get '/get_all_leds_per_leader', to: 'leaders#get_all_leds_per_leader'
      get '/get_colleagues', to: 'leaders#get_colleagues'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
