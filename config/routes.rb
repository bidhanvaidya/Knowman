Knowman::Application.routes.draw do
	
	resources :employment_statuses
	resources :offices
	resources :dashboard
	resources :companies do
		resources :staff_levels
	end
	
	resources :people
	resources :products
	resources :offices
	resources :funding_rounds
	resources :employment_statuses

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
