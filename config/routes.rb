Rails.application.routes.draw do
  resources :financial_goals
  get "up" => "rails/health#show", as: :rails_health_check

  root "financial_goals#index"
end
