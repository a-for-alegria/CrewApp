CrewApp::Application.routes.draw do
resources :crews
resources :clients

root 'crews#index'

end
