Rails.application.routes.draw do
  resources :profiles
  resources :favorites
  resources :posts do
    collection do
      post :confirm
    end
  end
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root to: 'posts#index'
  resources :favorites, only: [:create, :destroy, :index]
end
