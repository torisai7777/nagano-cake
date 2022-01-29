Rails.application.routes.draw do

 # 顧客用
# /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
}

# 管理者用
# /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'customers/my_page' => 'customers#show'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  post '/orders/confirm' => 'orders#confirm'
  
  get '/orders/completion' => 'orders#completion'
  
  patch 'customers/withdraw' => 'customers#withdraw'
  delete '/cart_items' => 'cart_items#destroy_all'

  resources :cart_items, except: [:new, :show, :edit]
  resources :items, only: [:index, :show]
  resources :customers, only: [ :edit, :update]
  resources :addresses, except:[:new,:show]
  resources :orders
 
namespace :admin do
  root 'homes#top'
  post '/search' => 'items#search'
  resources :order_details, only: [:update]
  resources :items, except: [:destroy]
  resources :customers, only: [:index,:show,:update,:edit]
  resources :orders, only: [:index,:show,:update]
  resources :genres, only: [:index,:create,:edit,:update,:destroy]
  resources :cart_items, except: [:new, :show, :edit]

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
