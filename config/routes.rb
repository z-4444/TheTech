Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: "user/registrations" 
  }
  namespace :admin do
    resources :users
    resources :products,except: [:index,:show]
  end

  resources :users, only: [:show]

  # namespace :users do
  #   resources :products, :catagories, :subcatagories     
  # end

  namespace :catagories do
    namespace :subcatagories do
      resources :products, only: [:index,:show]
      resources :comments
      resources :likes
    end
  end

  resources :myproducts, only: [:index,:show]
  resources :catagories
  resources :subcatagories do
    member do
      get :get_subcategory
    end  
  end
  resources :states,only: [:index]
  resources :cities,only: [:index]

  # namespace :products do
  #   resources :comments
  # end
  
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

end
