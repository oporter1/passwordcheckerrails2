Rails.application.routes.draw do
  #this get is the URL then hashes/matches to the password_controller.rb and runs the check method
  get '/check' => 'password#check'
end
