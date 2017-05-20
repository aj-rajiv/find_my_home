Rails.application.routes.draw do
 
  

  get 'password_resets/new'

  get 'resetpassword/forgot'

 root to:'welcome#main'
  get '/main' => 'welcome#main'
 
  get '/reg' => 'registrations#reg'
  post '/registrations' => 'registrations#create'
  get '/index' => 'registrations#index'
  get '/login' => 'logins#log'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy'
  get '/profile' => 'profiles#prof'
 get '/profile/:id' => 'profiles#show'
  
  get '/profile/:id/edit' => 'profiles#edit'
  
patch '/profile/:id' => 'profiles#update'
delete '/profile/:id' => 'profiles#destroy'
get '/forgot' =>'resetpassword#forgot'

resources :registrations
resources :logins
resources :password_resets
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
