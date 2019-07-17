Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/', {to:'welcome#index', as: :root})

  get '/users/:id/password', { to: "users#password", as: 'password' }
  patch '/users/:id/password', { to: "users#password_update", as: 'password_update' }

  resources :users, only: [:new, :create, :edit, :show]
  resource :session, only: [:new, :create, :destroy, :edit]
 
resources :posts do
  resources :comments, only: [:create, :destroy]
end

end
