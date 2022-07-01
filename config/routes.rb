Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :groups
  resources :users, only: [:show, :update]

  post "login" => "authentication#login"
  post "/groups/add_member" => "groups#add_member"

end
