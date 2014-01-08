Rails4::Application.routes.draw do
  root to: "categories#index"
  resources :categories
  devise_for :users
  namespace :admin do
     resources :m_manufacturers
  end
end
