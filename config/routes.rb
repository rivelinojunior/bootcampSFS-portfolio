Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :portfolios, except: :new do
    member do
      resources :payments, only: %i[index create]
    end
    resources(
      :tags,
      only: %i[create destroy],
      param: :tag_id,
      controller: :portfolio_tags
    )
    resources :blocks, only: %i[index create destroy] do
      resources :additional_informations, only: %i[index update]
      patch :positions, on: :collection, to: 'block_positions#update'
    end
    resources :profiles, only: %i[index update]
    resources :experiences, only: %i[index create destroy]
    resources :educations, only: %i[index create destroy]
    resources :skills, only: %i[index create destroy]
    resources :hobbies, only: %i[index create destroy]
    resources :languages, only: %i[index create destroy]
    resources :abouts, only: %i[index update]
    resources :socials, only: %i[index create destroy]
  end
  resources :tags, only: :index
  resources :search, only: :index
  resources :contact_forms, only: :create
  get '/:slug', to: 'portfolios#show'
  post '/webhooks', to: 'webhooks#webhooks'
end
