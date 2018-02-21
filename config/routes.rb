Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  post '/callback', to: 'callbacks#callback'
  get '/send_message', to: 'callbacks#send_message'
end
