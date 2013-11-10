Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/sample' => "users#sample"
  post '/receiver' => "users#receiver"
  get '/users/test_index' => "users#test_index"
end
