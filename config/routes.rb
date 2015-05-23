Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :faces
  resources  :invitations, only: [:new, :create, :update]

  get 'learn' => 'faces#learn'
end
