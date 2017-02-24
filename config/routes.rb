Rails.application.routes.draw do
  root to: 'application#angular'

  namespace 'api', defaults: { format: :json } do
    resources :projects
    resources :tasks
  end
end
