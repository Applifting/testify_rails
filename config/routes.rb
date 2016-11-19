Testify::Engine.routes.draw do

  get '/check' => 'check#index'

  post '/cases/(:id)/statements/(:statement_id)' => 'cases#statements'
  post '/cases/(:id)' => 'cases#create'

  delete '/cases/(:id)' => 'cases#destroy'

end
