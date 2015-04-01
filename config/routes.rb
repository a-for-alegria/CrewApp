CrewApp::Application.routes.draw do
  devise_for :users,controllers: {sessions: "user/sessions"}

  resources :crews
  resources :clients

  root 'crews#index'
end
