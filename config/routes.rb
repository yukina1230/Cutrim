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
  end

  namespace :admin do
    get "homes/info" => "homes#info"
  end

end
