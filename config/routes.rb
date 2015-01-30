CrewApp::Application.routes.draw do
  devise_for :users,controllers: {sessions: "user/sessions"}
  get "start_pages/start"

  resources :crews
  resources :clients

	root 'crews#index'
end
