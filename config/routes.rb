Knowman::Application.routes.draw do

	resources :dashboard
	  
	resources :people

	resources :products

	resources :companies do
	  resources :funding_rounds
	  resources :staff_levels
	end
	

	devise_for :users do
		get "sign_out", :to => "devise/sessions#destroy"
	end
  
	resources :folders do
			resources :notifications
			resources :topics do 
				get "all"
			resources :updates
			end
	end
	match '/userupdate', :to => 'updates#userupdate'
	root :to => 'dashboard#index'

end
