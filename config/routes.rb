CrewApp::Application.routes.draw do
  get "start_pages/start"
  get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
	resources :crews
	resources :clients

	root 'crews#index'
end
