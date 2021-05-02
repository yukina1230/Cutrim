Rails.application.routes.draw do
  scope module: :public do
    root "homes#top"
    get "homes/about" => "homes#about"
  end

  namespace :admin do
    get "homes/info" => "homes#info"
  end

end
