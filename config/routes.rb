Knowman::Application.routes.draw do
	
	
	resources :images
	resources :dashboard
	
	# Companies
	resources :companies do
		resources :funding_rounds
	end
	
	# Staff Levels
	resources :staff_levels
	
	# Products
	resources :products
	
	# Offices
	resources :offices
	
	# People
	resources :people
	
	# Employment Statuses
	resources :employment_statuses
	
	devise_for :users do
		get "sign_out", :to => "devise/sessions#destroy"
	end
  
	resources :folders do
			
			resources :topics do 
				get "all"
			resources :updates
			resources :notifications
			resources :attachments
			end
	end
	match '/userupdate', :to => 'updates#userupdate'
	root :to => 'dashboard#index'

end
