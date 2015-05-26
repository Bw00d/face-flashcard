Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users
  resources :faces
  resources :bugs, only: [:create, :new, :index, :update]
  resources  :invitations, only: [:new, :create, :update]

  get 'learn' => 'faces#learn'
  

  devise_scope :user do
    # get "/signup" => 'registrations#new'
    get "signup", to: "devise/registrations#new"
  end

end
