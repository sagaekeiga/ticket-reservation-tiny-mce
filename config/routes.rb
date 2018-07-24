Rails.application.routes.draw do
  resources :tickets, only: %i(new create index)
end
