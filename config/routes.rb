Knowman::Application.routes.draw do

	resources :dashboard
	  
	resources :people

	resources :projects

	resources :companies do
	  resources :funds
	  resources :stlevels
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
	root :to => 'folders#index'

end
