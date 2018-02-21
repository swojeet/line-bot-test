Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  post '/callback', to: 'callbacks#callback'
  get '/close', to: 'static_pages#close'
  get '/close_page', to: 'static_pages#close_page'
end
