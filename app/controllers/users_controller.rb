class UsersController < ApplicationController 

    # render the login form
    get '/login' do
      erb :'/users/login'
    end

     # receive the login form, find the user, and log him in.
    post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # Here's where the login happens
      flash[:login] = "Login Successful!"
      puts session
      redirect "users/#{user.id}"
    else
      flash[:alert] = "Email or password is incorrect please try again."
     redirect '/login'
     end
    end

    # render the signup form
    get '/signup' do
    erb :'/users/signup'
    end

    post '/users' do
      if params[:name] !="" && params[:email] != "" && params[:password] != ""
       user = User.create(params)
       
       session[:user_id] = user.id
       redirect "/users/#{user.id}"
       else
        redirect 'users/signup'
      end
    end

    
    get '/users/:id' do
     @user = User.find_by(id: params[:id])
      erb :'/users/show'
    end

    get '/logout' do 
      session.clear
      redirect '/'
    end
end