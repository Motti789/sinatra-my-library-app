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
    erb :signup
    end

    post '/users' do
      if params[:name] !="" && params[:email] != "" && params[:password] != ""
       @user = User.create(params)
       redirect "/#{@user.id"}
       erb :show
       else
      end
    end

    
    get '/users/:id' do     
      erb :show
    end
end