Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations', # 登録
    confirmations: 'users/confirmations', # 確認
    sessions: 'users/sessions'            # ログイン
  }
  resources :tickets, only: %i(new create index)
end
