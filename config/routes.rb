Rails.application.routes.draw do
  devise_for :salon_users, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
  }
  devise_scope :salon_user do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'users/my_page' => 'users#show', as: 'mypage'
    get 'users/infomation/edit' => 'users#edit', as: 'edit_infomation'
    patch 'users/infomation' => 'users#update', as: 'update_infomation'
    resources :salon_users, only: [:index, :show] do
      resources :reservations, only: [:index, :new, :create, :show, :destroy]
      collection do
        get 'search'
        get 'map'
      end
    end
    resources :posts, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
    get 'users/favorites' => 'users#favorites'
    get 'users/reservations' => 'users#reservations'
  end

  namespace :admin do
    get 'homes/info' => 'homes#info'
    get 'salon_users/mypage' => 'salon_users#show', as: 'salon_users_mypage'
    get 'salon_users/infomation/edit' => 'salon_users#edit', as: 'salon_users_edit_infomation'
    patch 'salon_users/infomation' => 'salon_users#update', as: 'salon_users_update_infomation'
    resources :menus, only: [:index, :create, :edit, :update, :destroy]
    resources :posts, except: [:show]
    resources :reservations, only: [:index, :show] do
      collection do
        get 'search'
      end
    end
  end

end
