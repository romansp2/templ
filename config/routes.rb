Rails.application.routes.draw do

 resources :users

 resources :users do
   resources :wallets
 end

 resources :wallets


 root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
