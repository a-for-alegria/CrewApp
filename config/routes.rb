CrewApp::Application.routes.draw do
  devise_for :users,controllers: {sessions: "user/sessions"}

  resources :crews
  resources :projects

  root 'dashboard#main_page'
end
