Knowman::Application.routes.draw do
  resources :people

  resources :projects

  resources :companies

  devise_for :users

  
  root :to => 'dashboard#index'

end
