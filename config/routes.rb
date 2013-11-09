Philosophy::Application.routes.draw do
  root to: "users#home"
  
  get '/sample' => "users#sample"
end
