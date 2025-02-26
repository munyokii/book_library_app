Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    resources :loans, only: [:create, :update]
  end

  resources :borrowers, only: [:index, :show]

  patch 'books/:book_id/return', to: 'loans#update', as: 'return_book'

  post 'borrowers/find_or_create', to: 'borrowers#find_or_create', as: 'find_or_create_borrower'
end
