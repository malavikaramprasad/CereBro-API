Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :users, defaults: { format: :json }
    resources :tokens

    scope '/current_user' do
      put '/add_skills' => 'current_user#add_skills'
      get '/skills' => 'current_user#skills'
    end
  end
end