Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  get 'twilio/twiml', to: 'twilio#twiml'
  get 'twilio/call', to: 'twilio#call'
  get 'twilio/callback', to: 'twilio#callback'
end