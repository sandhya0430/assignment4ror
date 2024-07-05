 Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    devise_for :users, controllers: { sessions: 'api/v1/auth/sessions', registrations: 'api/v1/auth/registrations' }
    resources :articles
  end
end
end