Knowman::Application.routes.draw do

  resources :offices

	resources :dashboard
	  
	resources :people

	resources :products
	resources :offices
	resources :staff_levels

	resources :companies do
		resources :funding_rounds
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
