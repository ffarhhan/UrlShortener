Rails.application.routes.draw do
  root 'url_shortener#show'
  post 'url_shortener/create'
  get 'url_shortener/edit'
  get 'url_shortener/show'
  post 'url_shortener/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
