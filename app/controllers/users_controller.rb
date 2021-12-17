class UsersController < ApplicationController 

    # render the login form
    get '/login' do
      erb :login
    end

    # render the signup form
    get '/signup' do

    end
end