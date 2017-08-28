Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :items
  resources :plans do
    resources :items, module: 'plans',only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
