Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :groups

  post "login" => "authentication#login"
  post "add_member" => "groups#add_member"

end
