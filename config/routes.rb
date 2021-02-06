Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      post '/inbound/sms' => 'inbound#sms'
      post '/outbound/sms' => 'outbound#sms'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
