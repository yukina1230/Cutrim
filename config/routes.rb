Rails.application.routes.draw do
  namespace :admin do
    get 'post_images/new'
    get 'post_images/index'
    get 'post_images/edit'
  end
  devise_for :salon_users, controllers: {
    sessions: 'salon_users/sessions',
    registrations: 'salon_users/registrations',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  scope module: :public do
    root "homes#top"
    get "homes/about" => "homes#about"
    get 'users/my_page' => 'users#show', as: 'mypage'
    get 'users/infomation/edit' => 'users#edit', as: 'edit_infomation'
    patch 'users/infomation' => 'users#update', as: 'update_infomation'
    resources :salon_users, only: [:index, :show]
  end

  namespace :admin do
    get "homes/info" => "homes#info"
    get 'salon_users/mypage' => 'salon_users#show', as: 'salon_users_mypage'
    get 'salon_users/infomation/edit' => 'salon_users#edit', as: 'salon_users_edit_infomation'
    patch 'salon_users/infomation' => 'salon_users#update', as: 'salon_users_update_infomation'
    resources :menus, only: [:index, :create, :edit, :update, :destroy]
    resources :post_images, only: [:new, :create, :index, :edit, :update, :destroy]
  end

end
