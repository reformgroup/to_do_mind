Rails.application.routes.draw do
  
  resources :lists do
    collection do
      patch :sort 
    end
  end
  resources :tasks do
    collection do
      patch :sort 
    end
  end
  
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
