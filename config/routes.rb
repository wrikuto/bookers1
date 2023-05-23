Rails.application.routes.draw do
  root 'books#top'
  delete '/books/:id', to: 'books#destroy', as: 'destroy_book'
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
