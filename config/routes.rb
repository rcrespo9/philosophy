Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/chart' => "users#chart"
  post '/receiver' => "users#receiver"
  get '/transmit' => "users#transmit"

end