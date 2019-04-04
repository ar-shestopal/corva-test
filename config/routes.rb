Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'compute/:request_id', to: 'api/v1/requests#compute', constraints: JsonConstraint.new
end