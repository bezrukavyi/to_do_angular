Rails.application.routes.draw do
  root 'application#angular'

  namespace 'api', defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth',
      controllers: { omniauth_callbacks: 'omniauth_callbacks' }

    resources :translations, only: :show
    resources :projects
    resources :tasks
  end

  get '*path', to: 'application#angular'
end
