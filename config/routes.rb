Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/sample' => "users#sample"
  post '/receiver' => "users#receiver"
  get '/test_index' => "users#test_index"
  get '/transmit' => "users#transmit"
end
