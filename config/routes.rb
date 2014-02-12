Rails4::Application.routes.draw do
  devise_for :visitors
  resources :categories
  devise_for :users
  namespace :admin do
     resources :m_manufacturers
     resources :m_amounts
     resources :m_statuses
     resources :m_prefectures
     resources :post_buy_cars
     resources :salon_cars
     resources :exteriors
     resources :interiors
     resources :gearboxes
     resources :drivens
     resources :currencies
     resources :m_life_cars
     resources :instruction_boots
     resources :m_origins
     resources :cars
  end
  
scope module: :visitor do
    root to: "top#index"
    resources :top, only: :index
    resources :m_manufacturers, only: [:show, :index]
    resources :cars, only: [:show]
  end
end
