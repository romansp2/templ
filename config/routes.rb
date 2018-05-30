Rails.application.routes.draw do
  get 'wallets/index'

  get 'wallets/new'

  get 'wallets/create'

  get 'wallets/show'

  get 'wallets/edit'

  get 'wallets/update'

  get 'wallets/destroy'

  get 'users/new'

 resources :users

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
