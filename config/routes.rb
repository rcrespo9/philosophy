Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/sample' => "users#sample"
  post '/users/feeder' => "users#feeder"
  get '/users/feeder' => "users#feeder"
end
