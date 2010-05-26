Sclc::Application.routes.draw do |map|
  resources :invitations

  resources :users

  root :to => "root#index"
  
  controller :sessions do
    get     "login"   => :new
    post    "login"   => :create
    delete  "logout"  => :destroy
  end
  
  resources :sessions
end
