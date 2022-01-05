class UsersController < ApplicationController 

    # render the login form
    get '/login' do
      if !logged_in?
      erb :'/users/login'
      else
        redirect to '/book_entries'
      end
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

    #render the signup form
    get '/signup' do
      if !logged_in?
     erb :'/users/signup'
      else 
        redirect to '/book_entries'
      end
    end

    post '/users' do
      if params[:name] == "" || params[:email] == "" || params[:password] == ""
        flash[:signup1] = "Error! Please fill out all fields."
        redirect '/signup'
      else
       user = User.create(params)
       
       session[:user_id] = user.id
       flash[:signup2] = "Signup Successful!"
       redirect "/users/#{user.id}"
      end
    end

    
    get '/users/:id' do
     @user = User.find_by(id: params[:id])
      erb :'/users/show'
    end

    get '/about' do
      erb :'users/about'
    end

    get '/logout' do 
      session.clear
      redirect '/'
    end
end