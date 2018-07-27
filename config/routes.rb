Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations', # 登録
    confirmations: 'users/confirmations', # 確認
    sessions: 'users/sessions'            # ログイン
  }
  resources :tickets, only: %i(new create index)

  #
  # ユーザー
  #
  namespace :users do
    resources :tickets do
      resources :deliveries, only: %i(new create) do
        get :confirm, to: 'deliveries#new', on: :collection
      end
    end
    get :complete, to: 'deliveries#complete' #追加
  end
end
