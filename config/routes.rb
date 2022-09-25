Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers:{
   registrations: "user/registrations",
   sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }

  root to: 'user/homes#top'

  namespace :admin do
    resources :items, except: [:show]
    resources :genres, except: [:new, :show]
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :destroy]
    resources :review_comments, only: [:index, :destroy]
  end


  namespace :user do
    resources :mypage, only: [:show, :edit, :update]
    get 'items/search' => 'items#search'
    resources :items, only: [:show, :index] do
      resources :reviews, only: [:new, :create, :index, :show] do
        resources :review_comments, only: [:create]
      end
    end
    #ランキング表示のルーティング
    get 'ranks/rank' => 'ranks#rank'
    get 'ranks/sourness_ranks' => 'ranks#sourness_ranks'
    get 'ranks/sweetness_ranks' => 'ranks#sweetness_ranks'
    get 'ranks/bitterness_ranks' => 'ranks#bitterness_ranks'
    # 退会確認画面
    get '/mypage/:id/unsubscribe' => 'mypage#unsubscribe', as: 'unsubscribe'
    # 退会用
    patch '/mypage/:id/withdrawal' => 'mypage#withdrawal', as: 'withdrawal'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
