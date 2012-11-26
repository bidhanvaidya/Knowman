Knowman::Application.routes.draw do
	
	


  

	resources :images
	resources :dashboard
	
	# Companies
	resources :companies
	
	# Funding Rounds
	resources :funding_rounds
	
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
	
	resources :user_stories do 
	
	member do
	put 'check'
	end
	resources :topics do
	resources :checks
	end
	end
  resources :researches do 
  
		resources :folders do
			resources :topics do 
			resources :updates
				resources :notifications
				resources :attachments
			end
		end
		
	end
	resources :searches
	
	
	match '/userupdate', :to => 'updates#userupdate'
	root :to => 'dashboard#index'

end
