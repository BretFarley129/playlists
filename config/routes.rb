Rails.application.routes.draw do
  
    # SESSIONS
    root 'sessions#landing'
    get '/main' => 'sessions#index'
    post 'sessions/new' => 'sessions#login'
    delete 'sessions/logout' => 'sessions#logout'
  
    # USERS
    get 'users/:id' => 'users#show'
    post 'users/new' => 'users#create'
    
    # SONGS
    get 'songs' => 'songs#index'
    get 'songs/:id' => 'songs#show'
    post 'songs/new' => 'songs#create'
  
    # ADDS
    post 'adds/:id' => 'adds#add'
  
  end
  