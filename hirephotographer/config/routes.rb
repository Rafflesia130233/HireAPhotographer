Rails.application.routes.draw do
  resources :feedbacks
  resources :conversations do
    resources :messages
  end
  resources :certifications
  resources :experiences
  resources :profiles
  resources :profilepictures
  resources :photos
  resources :educations
  resources :trainings
  resources :payments
  resources :applications
  resources :hire_details
  resources :personalinformations
  resources :destroys
  resources :job_details
  namespace :customer do
    resources :users
  end
  namespace :photographer do
    resources :users
  end

  resources :users
  get "/pages/:page", to: "pages#show"
  get '/search/job', to: 'job_details#search'
  get '/search/photographer', to: 'personalinformations#search'
  get '/signup', to: 'home_page#signup'
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home_page#index'
end
