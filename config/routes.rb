Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :users
    resources :tokens
    resources :questions
    resources :reviews
    resources :devices

    scope '/current_user' do
      get '/' => 'current_user#show'
      put '/add_skills' => 'current_user#add_skills'
      get '/skills' => 'current_user#skills'
      put '/add_preferred_location' => 'current_user#add_preferred_location'
    end
  end
end