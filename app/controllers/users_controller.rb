class UsersController < ApplicationController 

    # render the login form
    get '/login' do
      erb :login
    end

     # receive the login form, find the user, and log him in.
    post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id # Here's where the login happens
      redirect "users/#{@user.id}"





    else
     end
    end

    # render the signup form
    get '/signup' do

    end

    get '/users/:id' do     #dynamic route which will change based off the user
      "This is the users route"
    end
end