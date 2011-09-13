PasswordApp::Application.routes.draw do

  resources :items

  resources :folders

  resources :users

  resources :groups

  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end

  controller :favorites do
    get "favorites" => :index
    post "favorites" => :create
    delete "favorites" => :destroy
  end

  controller :help do
    get "help" => :index
  end

  root :to => "favorites#index"
end
