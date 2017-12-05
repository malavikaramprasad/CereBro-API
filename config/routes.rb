Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :users
    resources :tokens
    resources :questions do
      member do
        put '/request_tutor' => 'questions#request_tutor'
      end
    end
    resources :reviews
    resources :skills
    resources :devices

    scope '/current_user' do
      get '/' => 'current_user#show'
      put '/update' => 'current_user#update'
      put '/add_skills' => 'current_user#add_skills'
      get '/skills' => 'current_user#skills'
      get 'tutor_requests' => 'current_user#tutor_requests'
      get 'learner_requests' => 'current_user#learner_requests'
      put '/add_preferred_location' => 'current_user#add_preferred_location'
      put '/request_tutor' => 'current_user#request_tutor'
    end
  end
end
