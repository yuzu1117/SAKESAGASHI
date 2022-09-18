Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers:{
   registrations: "user/registrations",
   sessions: 'user/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }

  root to: 'user/homes#top'

  namespace :admin do
    resources :items
    resources :genres, except: [:new,:show]
    resources :users, only: [:index, :show]
  end

  namespace :user do
    resources :mypage, only: [:show, :edit, :update]
    get 'items/search' => 'items#search'
    resources :items, only: [:show] do
      resources :reviews, only: [:new, :create, :index]
    end
    # 退会確認画面
    get '/mypage/:id/unsubscribe' => 'mypage#unsubscribe', as: 'unsubscribe'
    # 退会用
    patch '/mypage/:id/withdrawal' => 'mypage#withdrawal', as: 'withdrawal'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
