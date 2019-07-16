Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/', {to:'welcome#index', as: :root})


resources :users, only: [:create, :new, :edit]
resources :sessions, only: [:create, :new, :destroy]
resources :posts do
  resources :comments, only: [:create, :destroy]
end

end
