Rails.application.routes.draw do

  root 'site#index'

  scope :api do 
    get 'tables/:id/deal(.:format)' => 'tables#deal'
    get 'tables/:id/flop(.:format)' => 'tables#flop'
    get 'tables/:id/turn(.:format)' => 'tables#turn'
    get 'tables/:id/river(.:format)' => 'tables#river'
    get 'tables/:id/clear(.:format)' => 'tables#clear'
    get 'tables/:id/winner(.:format)' => 'tables#winner'
  end
  
  resources :tables

end
