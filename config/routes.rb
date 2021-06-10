Rails.application.routes.draw do
devise_for :users, {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

   root 'homes#top'
   get "home/about"  => 'homes#about'
   get "users/sign_up" => 'devise/sessions#new'
   get "users/sign_in" => 'devise/registrations#new'
   post "books/:id"  => 'books#create'
 delete 'books/:id'  => 'books#destroy', as: 'destroy_book'
  delete 'users/:id'  => 'books#destroy', as: 'destroy2_book'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :homes
  resources :users, only: [:show, :index, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
