Rails.application.routes.draw do
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
  end

  namespace :admin do
    get "homes/info" => "homes#info"
  end

end
