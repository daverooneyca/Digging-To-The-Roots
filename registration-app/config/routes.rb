Rails.application.routes.draw do
  root 'index#index'

  match '/register' => 'index#register', :via => [:post]
  match '/contact' => 'index#contact', :via => [:post]  
end
