Rails.application.routes.draw do
  root to: "public/homes#top"
  get '/about' => 'public/homes#about', as: 'about'

  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    root to: "homes#top"
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:confirm, :withdrawal]
    get "customers/mypage" => "customers#show", as: 'customer'
    get "customers/infomation/edit" => "customers#edit", as: 'customer_edit'
    patch "customers/infomation" => "customers#update", as: 'customer_update'
    get "customers/confirm" => "customers#confirm", as: 'customer_confirm'
    patch "customers/withdrawal" => "customers#withdrawal", as: 'customer_withdrawal'
    resources :addresses, except: [:new]
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm", as: 'order_confirm'
    get "orders/complete" => "orders#conplete", as: 'order_complete'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: 'cart_items_destroy_all'
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
