Rails.application.routes.draw do
  root 'site#index'

  # Log in/out
  get    'login'          => 'session#new',         as: :login_form
  post   'login'          => 'session#create',      as: :log_in
  delete 'logout'         => 'session#destroy',     as: :log_out

  # Password reset
  get    'reset/:code'    => 'password#edit',       as: :password_reset_form
  patch  'reset/:code'    => 'password#update',     as: :reset_password

  resources :companies do
    member do
      patch  'vetted' => 'companies#vet'
      delete 'vetted' => 'companies#unvet'
    end
  end

  resources :jobs

  resources :members

  resources :managers

  resources :contacts, only: [ :index, :destroy ]
end
