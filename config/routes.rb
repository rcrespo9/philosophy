Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/sample' => "users#sample"
  post '/receiver' => "users#receiver"
  get '/transmit' => "users#transmit"
  get '/chart' => "users#chart"

end
